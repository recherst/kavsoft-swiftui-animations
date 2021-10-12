//
//  Home.swift
//  GradientPicker
//
//  Created by recherst on 2021/10/11.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var search = ""
    @State var gradients = [Gradient]()
    @State var colums = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    @State var filtered: [Gradient] = []

    var body: some View {
        VStack {
            HStack(spacing: 15) {
                if show {
                    // Search bar
                    TextField("Search Gradient", text: $search)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        // Search bar functionality
                        .onChange(of: search) { value in
                            if search != "" {
                                searchColor()
                            } else {
                                // Clear all search results
                                search = ""
                                filtered = gradients
                            }
                        }

                    Button(action: {
                        withAnimation(.easeOut) {
                            // Clear search
                            search = ""
                            // safe side
                            filtered = gradients
                            show.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    })
                } else {
                    Text("Gradients")
                        .font(.system(size: 30))
                        .fontWeight(.bold)

                    Spacer()

                    Button(action: {
                        withAnimation(.easeOut) {
                            show.toggle()
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    })

                    Button(action: {
                        withAnimation(.easeOut) {
                            if colums.count == 1 {
                                colums.append(GridItem(.flexible(), spacing: 20))
                            } else {
                                colums.removeLast()
                            }
                        }
                    }, label: {
                        Image(systemName: colums.count == 1 ? "square.grid.2x2.fill" : "rectangle.grid.1x2.fill")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    })
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            .padding(.horizontal)
            .zIndex(1)

            if gradients.isEmpty {
                // Loading view
                ProgressView()
                    .padding(.top, 55)

                Spacer()
            } else {
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: colums, spacing: 20, content: {
                        ForEach(filtered, id: \.name) { gradient in
                            VStack(spacing: 15) {
                                ZStack {
                                    LinearGradient(
                                        gradient: .init(colors: HexToRGB(colors: gradient.colors)),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .frame(height: 180)
                                    .clipShape(CShape())
                                    .cornerRadius(15)
                                    .contentShape(CShape())
                                    .contextMenu {
                                        Button(action: {
                                            // Copy to clipboard
                                            var colorCode = ""
                                            for color in gradient.colors {
                                                colorCode += color + "\n"
                                            }
                                            UIPasteboard.general.string = colorCode
                                        }, label: {
                                            Text("Copy")
                                        })
                                    }

                                    Text(gradient.name)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                }

                                if colums.count == 1 {
                                    HStack(spacing: 15) {
                                        ForEach(gradient.colors, id: \.self) { color in
                                            Text(color)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                        }
                    })
                    .padding(.horizontal)
                    .padding(.bottom)
                })
                .zIndex(0)
            }
        }
        .onAppear(perform: {
            getColors()
        })
    }

    func getColors() {
        let url = "https://raw.githubusercontent.com/ghosh/uiGradients/master/gradients.json"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let jsonData = data else { return }

            do {
                let colors = try JSONDecoder().decode([Gradient].self, from: jsonData)
                self.gradients = colors
                self.filtered = colors
            }
            catch {
                print(error)
            }
        }
        .resume()
    }

    // Convert hex number to UIColor
    func HexToRGB(colors: [String]) -> [Color] {
        var colors1 = [Color]()

        for color in colors {
            // Remove #
            var trimmed = color.trimmingCharacters(in: .whitespaces).uppercased()
            trimmed.remove(at: trimmed.startIndex)

            var hexValue: UInt64  = 0
            Scanner(string: trimmed).scanHexInt64(&hexValue)

            let r = CGFloat((hexValue & 0x00FF0000) >> 16) / 255
            let g = CGFloat((hexValue & 0x0000FF00) >> 8) / 255
            let b = CGFloat((hexValue & 0x000000FF)) / 255
            colors1.append(Color(UIColor(red: r, green: g, blue: b, alpha: 1.0)))
        }

        return colors1
    }

    func searchColor() {
        let query = search.lowercased()
        // Use bg thread to reduce main ui usage
        DispatchQueue.global(qos: .background).async {
            let filter = gradients.filter { $0.name.lowercased().contains(query) }

            DispatchQueue.main.async {
                withAnimation(.spring()) {
                    self.filtered = filter
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
