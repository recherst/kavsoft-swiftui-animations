//
//  Home.swift
//  CourseAppUI
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct Home: View {
    @State var text = ""
    var edge = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Hello Carlos")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Let's upgrade your skill!")
                })
                .foregroundColor(.black)

                Spacer(minLength: 0)

                Button(action: {}, label: {
                    Image("profile")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .background(Color.purple)
                        .cornerRadius(10)
                })
            }
            .padding()

            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)

                        TextField("Search Courses", text: $text)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())

                    HStack {
                        Text("Categories")
                            .font(.title2)
                            .fontWeight(.bold)

                        Spacer(minLength: 0)

                        Button(action: {}, label: {
                            Text("View All")
                        })
                    }
                    .foregroundColor(.black)
                    .padding(.top, 25)

                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20, content: {
                        ForEach(courses) { course in
                            NavigationLink(
                                destination: DetailView(course: course),
                                label: {
                                    CourseCardView(course: course)
                                })
                        }
                    })
                    .padding(.top)
                }
                .padding()
                .padding(.bottom, edge!.bottom + 70)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
