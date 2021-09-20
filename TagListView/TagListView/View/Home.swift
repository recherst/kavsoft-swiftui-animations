//
//  Home.swift
//  TagListView
//
//  Created by recherst on 2021/9/3.
//

import SwiftUI

struct Home: View {
    @State var text = ""
    @State var chips: [[Chip]] = [

    ]

    var body: some View {
        VStack(spacing: 35) {
            ScrollView {
                // Chips View
                LazyVStack(alignment: .leading, spacing: 10) {
                    // Since we're using indices so we need to specify id
                    ForEach(chips.indices, id: \.self) { index in
                        HStack {
                            // Sometimes it asks us to specify hashable in data model
                            ForEach(chips[index].indices, id: \.self) { chipIndex in
                                Text(chips[index][chipIndex].chipText)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color.black, lineWidth: 1))
                                    .lineLimit(1)
                                    // Main logic
                                    .overlay(
                                        GeometryReader { reader -> Color in
                                            // By using MaxX parameter we can use logic and determine if its exceeds or not
                                            let maxX = reader.frame(in: .global).maxX
                                            // Both Paddings = 30 + 30 = 60
                                            // Plus 10 for extra
                                            // Do action only if the item exceeds
                                            if maxX > UIScreen.main.bounds.width - 70 && !chips[index][chipIndex].isExceeded {
                                                // It is updating to each user interaction
                                                DispatchQueue.main.async {
                                                    // Toggle that
                                                    chips[index][chipIndex].isExceeded = true
                                                    // Get last item
                                                    let lastItem = chips[index][chipIndex]
                                                    // Remove item from current row
                                                    // Insert it as new item
                                                    chips.append([lastItem])
                                                    chips[index].remove(at: chipIndex)
                                                }
                                            }
                                            return Color.clear
                                        },
                                        alignment: .trailing
                                    )
                                    .clipShape(Capsule())
                                    .onTapGesture {
                                        // Remove data
                                        chips[index].remove(at: chipIndex)
                                        // If the inside array is empty removing that also
                                        if chips[index].isEmpty {
                                            chips.remove(at: index)
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding()
            }
            .frame(
                width: UIScreen.main.bounds.width - 30,
                height: UIScreen.main.bounds.height / 3
            )
            // Border
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
            )

            // TextEditor
            TextEditor(text: $text)
                .padding()
                // Border with Fixed size
                .frame(height: 150)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
                )
            // Add Button
            Button(action: {
                // Add empty array if there is nothing
                if chips.isEmpty {
                    withAnimation(.default) {
                        chips.append([Chip(chipText: text)])
                        text = ""
                    }
                } else {
                    withAnimation(.default) {
                        // Add chip to last Array
                        chips[chips.count - 1].append(Chip(chipText: text))
                        // Clear old text in editor
                        text = ""
                    }
                }
            }, label: {
                Text("Add Tag")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(4)
            })
            // Disable button when text is empty
            .disabled(text == "")
            .opacity(text == "" ? 0.45 : 1)
        }
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
