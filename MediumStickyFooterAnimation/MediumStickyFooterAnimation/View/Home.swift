//
//  Home.swift
//  MediumStickyFooterAnimation
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

struct Home: View {
    // Splits array of article into two
    var splitArticle: [[String]] {
        let mid = articleParagraphs.count / 2

        var splitArray1 = [String]()
        var splitArray2 = [String]()

        for index in 0..<mid - 1 {
            splitArray1.append(articleParagraphs[index])
        }
        for index in mid..<articleParagraphs.count {
            splitArray2.append(articleParagraphs[index])
        }

        return [splitArray1, splitArray2]
    }
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15, pinnedViews: [.sectionFooters], content: {
                Section(footer: FooterView()) {
                    Text("I never wanted to post about this online, but...")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Profile view
                    HStack(spacing: 15) {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 5) {
                            Text("iJustine")
                                .foregroundColor(.green)

                            Text("21 Mar 2020 · Min Read")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Button(action: {}, label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })

                        Button(action: {}, label: {
                            Image(systemName: "bookmark")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })

                    }
                    .padding(.horizontal)

                    // Article paragraphs
                    // Split article to insert image in mid of article
                    ForEach(splitArticle[0], id: \.self) { article in
                        Text(article)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }

                    // Article images
                    Image("article_img1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal)
                        .padding(.top, 10)

                    // Remaining article
                    ForEach(splitArticle[1], id: \.self) { article in
                        Text(article)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }

                    // Article end images
                    Image("article_img2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal)
                        .padding(.top, 10)
                }

                // Featured content
                Text("Featured")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Feature rows
                FeatureContent()
                    .padding(.bottom)

            })
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct FeatureContent: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                Image("featured1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)

                Text("One of people's biggest fears is change. Whether someone isn't what you want them to be,")
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 15) {
                Image("featured2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)

                Text("I recently shot this amazing 370 Virtual Reality video for my YouTube channel with Surreal and directed by Lan Bui.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 15) {
                Image("featured3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)

                Text("10 years ago I couldn't have told you my plan on how to get here because this here didn't even exist yet.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
