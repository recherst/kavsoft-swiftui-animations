//
//  Detail.swift
//  AppStoreAnimations
//
//  Created by recherst on 2021/9/15.
//

import SwiftUI

struct Detail: View {
    // Get current selected item
    @ObservedObject var detail: DetailViewModel
    var animation: Namespace.ID

    @State var scale: CGFloat = 1

    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                    Image(detail.selectedItem.contentImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: detail.selectedItem.contentImage, in: animation)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)

                    HStack {
                        Text(detail.selectedItem.overlay)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)

                        Spacer(minLength: 0)

                        Button(action: {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                detail.show.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color.black.opacity(0.7))
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                        })
                    }
                    .padding(.horizontal)
                    // Since we ignored top safe area
                    .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                })
                // Gesture for closing detail view
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged(onChanged(value:))
                        .onEnded(onEnded(value:))
                )

                HStack {
                    Image(detail.selectedItem.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .cornerRadius(15)

                    VStack(alignment: .leading, spacing: 6, content: {

                        Text(detail.selectedItem.title)
                            .fontWeight(.bold)

                        Text(detail.selectedItem.category)
                            .font(.caption)
                            .foregroundColor(.gray)
                    })

                    Spacer(minLength: 0)

                    VStack {
                        Button(action: {}, label: {
                            Text("GET")
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.primary.opacity(0.1))
                                .clipShape(Capsule())
                        })

                        Text("In App Purchases")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .matchedGeometryEffect(id: detail.selectedItem.id, in: animation)
                .padding()

                Text("Having two variants (with rumors of future versions with even more core options intended for the Mac Mini and Mac Pro) makes a lot of sense: In my testing, the M1 chip has performed almost identically regardless of device, giving the iPad as much power as the Mac Mini. That doesn't make sense for buyers of high-end equipment, where opting for a lesser processor can potentially save you thousands or where a discrete GPU may be essential. The two variants could explain why guesses about the name of the new CPU, M1X or M2, haven't tipped conclusively toward one or the other. In addition to an upgraded model of a 16-inch MacBook Pro, we might be in for a 14-inch replacement for the 13-inch MacBook Pro, which could mean a 14-inch screen that fits into the chassis roughly the same size as the 13 -- thanks to smaller screen bezels. That follows a similar trend we've seen in Windows laptops and the same approach Apple took when it transitioned from the 15-inch to 16-inch MacBook Pro models. ")
                    .padding()

                Button(action: {}, label: {
                    Label(
                        title: {
                            Text("Share")
                                .foregroundColor(.primary)
                        },
                        icon: {
                            Image(systemName: "square.and.arrow.up.fill")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(10)
                })
                .padding()
            }
        }
        .scaleEffect(scale)
        .ignoresSafeArea(.all, edges: .top)
    }

    func onChanged(value: DragGesture.Value) {
        // Calculate scale value by total height
        let scale = value.translation.height / UIScreen.main.bounds.height

        if 1 - scale > 0.7 {
            self.scale = 1 - scale
        }

    }

    func onEnded(value: DragGesture.Value) {
        withAnimation(.spring()) {

            // Close detail view when scale is less than 0.9
            if scale < 0.9 {
                detail.show.toggle()
            }
            scale = 1
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
