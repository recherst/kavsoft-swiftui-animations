//
//  PickerIntroduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/12.
//

import SwiftUI

// To get or set a value for the Picker, you need to bind it to a variable.
// This variable is then passed into the Picker's initializer. Then, all
// you need to do is change this bound variable's value to select the row
// you want to show in the Picker. Or read the bound variable's value to see
// which row is currently selected. One thing to note is what this variable
// is actually bound to the Picker row's tag property which you will see in
// the following pages.

struct PickerIntroduction: View {
    @State private var favoriteState = 1
    @State private var yourName = "Mark"

    var body: some View {
        VStack(spacing: 20) {
            Text("Picker")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)

            Text("You associate a variable with the picker row's tag values")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color("AccentColorDark"))
                .foregroundColor(Color.white)

            Picker(selection: $favoriteState, label: Text("States"), content: {
                Text("California")
                    .tag(0)
                Text("Utah")
                    .tag(1)
                Text("Vermont")
                    .tag(2)
            })
            .padding(.horizontal)

            Text("Tag values can be String, Int or Bool.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color("AccentColorDark"))
                .foregroundColor(Color.white)

            Picker(selection: $yourName, label: Text("Your name"), content: {
                Text("Paul")
                    .tag("Paul")
                Text("Chris")
                    .tag("Chris")
                Text("Mark")
                    .tag("Mark")
                Text("Scott")
                    .tag("Scott")
                Text("Meng")
                    .tag("Meng")
            })
            .padding(.horizontal)
        }
    }
}

struct PickerIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        PickerIntroduction()
    }
}
