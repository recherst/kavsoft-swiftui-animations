//
//  Today.swift
//  AppStoreAnimations
//
//  Created by recherst on 2021/9/15.
//

import SwiftUI

struct Today: View {
    var animation: Namespace.ID

    @EnvironmentObject var detail: DetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .bottom, content: {
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("SATURDAY 14 NOVEMBER")
                            .foregroundColor(.gray)
                        Text("Today")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                    })
                })
                .padding()

                ForEach(items) { item in
                    // CardView
                    TodayCardView(item: item, animation: animation)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                detail.selectedItem = item
                                detail.show.toggle()
                            }
                        }
                }
            }
            .padding(.bottom)
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
    }
}

struct Today_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
