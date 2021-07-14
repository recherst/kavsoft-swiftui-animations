//
//  RowWithImages.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct RowWithImages: View {
    @State private var youTuberName = "Mark"
    var body: some View {
        VStack(spacing: 20) {
            Text("Picker")
                .font(.largeTitle)
            Text("Rows with Images")
                .font(.title)
                .foregroundColor(.gray)
            Text("Who do you want to watch today?")
                .padding(.top)

            Picker(selection: $youTuberName, label: Text("")) {
                Row1(name: "Sean")
                Row1(name: "Chris")
                Row1(name: "Mark")
                Row1(name: "Scott")
                Row1(name: "Paul")
            }
            .foregroundColor(Color.white)
            .padding(.horizontal)
            .background(Color("AccentColorDark"))
            .cornerRadius(15)
            .shadow(radius: 20)
            .labelsHidden()
        }
    }
}

private struct Row1: View {
    var name: String
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .padding(.trailing)
                .foregroundColor(Color.red)
            Text(name)
        }
        .tag(name)
    }
}

struct RowWithImages_Previews: PreviewProvider {
    static var previews: some View {
        RowWithImages()
    }
}
