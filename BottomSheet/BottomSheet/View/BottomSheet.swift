//
//  BottomSheet.swift
//  BottomSheet
//
//  Created by recherst on 2021/10/5.
//

import SwiftUI

struct BottomSheet: View {
    @State var text = ""
    @Binding var offset: CGFloat
    var value: CGFloat
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 50, height: 5)
                .padding(.top)
                .padding(.bottom, 5)

            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22))
                    .foregroundColor(.gray)

                TextField("Search Place", text: $text) { status in
                    withAnimation {
                        offset = value
                    }
                } onCommit: {
                    
                }

            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            // BlurView
            // For dark mode adoption
            .background(BlurView(style: .systemMaterial))
            .cornerRadius(15)
            .padding()

            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack(alignment: .leading, spacing: 15, content: {
                    ForEach(1...15, id: \.self) { count in
                        Text("Search Place")

                        Divider()
                            .padding(.top, 10)
                    }
                })
                .padding()
                .padding(.top)
            })
        }
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(15)
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
