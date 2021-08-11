//
//  Home.swift
//  ScrollViewOffset
//
//  Created by recherst on 2021/8/11.
//

import SwiftUI

struct Home: View {
    // Offset value
    // Since we're going to fetch offset for both vertical and horizontal
    // so we're using CGPoint
    @State var offset: CGPoint = .zero
    var body: some View {
        NavigationView {
            CustomScrollView(offset: $offset, showIndicators: true, axis: .vertical, content: {

                // Your General scroll view content
                LazyVStack(spacing: 15) {
                    ForEach(1...30, id: \.self) { _ in
                        HStack(spacing: 15) {
                            Circle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(width: 70, height: 70)

                            VStack(alignment: .leading, spacing: 15, content: {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.6))
                                    .frame(height: 15)
                                Rectangle()
                                    .fill(Color.gray.opacity(0.6))
                                    .frame(height: 15)
                                    .padding(.trailing, 90)
                            })
                        }
                    }
                }
                .padding()
            })
            .navigationTitle("Offset: \(String(format: "%.1f", offset.y))")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


// Building Custom ScrollView Using View Builder
struct CustomScrollView<Content: View>: View {
    // To hold our view or to capture the described view
    var content: Content
    @Binding var offset: CGPoint
    @State var startOffset: CGPoint = .zero
    var showIndicators: Bool
    var axis: Axis.Set
    // Since it will carry multiple views
    // so it will be a closure and it will return view
    init(offset: Binding<CGPoint>, showIndicators: Bool, axis: Axis.Set, @ViewBuilder content: ()->Content) {
        self.content = content()
        self._offset = offset
        self.showIndicators = showIndicators
        self.axis = axis
    }

    var body: some View {
        ScrollView(axis, showsIndicators: showIndicators, content: {
            content
                .overlay(
                    // Using Geometry reader to get offset
                    GeometryReader { proxy -> Color in
                        let rect = proxy.frame(in: .global)
                        if self.startOffset == .zero {
                            DispatchQueue.main.async {
                                self.startOffset = CGPoint(x: rect.minX, y: rect.minY)
                            }
                        }
                        DispatchQueue.main.async {
                            // Minus from current
                            self.offset = CGPoint(x: startOffset.x - rect.minX, y: startOffset.y - rect.minY)
                        }
                        return Color.clear
                    }
                    // Since we're also fetching horizontal offset
                    // so setting width to full so that minX will be zero
                    .frame(width: UIScreen.main.bounds.width, height: 0)

                    ,alignment: .top
                )
        })
    }
}
