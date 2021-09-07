//
//  DetailView.swift
//  HeroCarouselSlider
//
//  Created by recherst on 2021/9/8.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model: CarouselViewModel
    var animation: Namespace.ID

    var body: some View {
        ZStack {
            VStack {
                Text("Monday 28 December")
                    .font(.caption)
                    .foregroundColor(Color.white.opacity(0.85))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 10)
                    .matchedGeometryEffect(id: "Date-\(model.selectedCard.id)", in: animation)

                HStack {
                    Text(model.selectedCard.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 250, alignment: .leading)
                        .padding()
                        .matchedGeometryEffect(id: "Title-\(model.selectedCard.id)", in: animation)

                    Spacer(minLength: 0)
                }

                // Detail text content
                // Show content some delay for better animation
                if model.showContent {
                    Text(model.content)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                }

                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                model.selectedCard.cardColor
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: "bgColor-\(model.selectedCard.id)", in: animation)
                    .ignoresSafeArea(.all, edges: .bottom)
            )

            // Close button
            VStack {
                Spacer()

                if model.showContent {
                    Button(action: closeView, label: {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                            .padding(5)
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                    .padding(.bottom)
                }
            }
        }
    }

    func closeView() {
        withAnimation(.spring()) {
            model.showCard.toggle()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeIn) {
                    model.showContent = false
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
