//
//  PickerCustomized.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/12.
//

import SwiftUI

struct PickerCustomized: View {
    @State private var favoriteState = 1
    @State private var youTuberName = "Mark"

    var body: some View {
        VStack(spacing: 30) {
            Text("Picker")
                .font(.largeTitle)
            Text("With Modifier")
                .foregroundColor(.gray)
            Text("Your Favorite State:")
            Picker(selection: $favoriteState, label: Text(""), content: {
                Text("California")
                    .tag(0)
                Text("Utah")
                    .tag(1)
                Text("Vermont")
                    .tag(2)
            })
            .foregroundColor(Color.white)
            .padding(.horizontal)
            .background(Color("AccentColorDark"))
            .cornerRadius(15)
            .shadow(radius: 5)
            Text("Who do you want to watch today?")
            Picker(selection: $youTuberName, label: Text("")) {
                Text("Paul").tag("Paul")
                Text("Chris").tag("Chris")
                Text("Mark").tag("Mark")
                Text("Scott").tag("Scott")
                Text("Meng").tag("Meng")
            }
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.blue, lineWidth: 1)
            )
        }
        // Show no labels on pickers
        .labelsHidden()
        .font(.title)
    }
}

struct PickerCustomized_Previews: PreviewProvider {
    static var previews: some View {
        PickerCustomized()
    }
}
