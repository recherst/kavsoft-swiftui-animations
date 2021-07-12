//
//  RowWithImages.swift
//  TestPadding
//
//  Created by 刘勇刚 on 2021/7/13.
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
                Row(name: "Sean")
                Row(name: "Chris")
                Row(name: "Mark")
                Row(name: "Scott")
                Row(name: "Paul")
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

fileprivate struct Row: View {
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
