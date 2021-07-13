//
//  FormIntroduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

// The Form view is a great choice when you want to show settings, options, or get some user input.
// It is easy to set up and customize as you will see on the following pages.

// This is a push-out view.

struct FormIntroduction: View {
    var body: some View {
        Form {
            Section {
                Text("This is a Form!")
                    .font(.title)
                Text("You can put any content in here")
                Text("The cells will grow to fit the content")
                Text("Remember, it's just views inside of views")
            }

            Section {
                Text("Limitations")
                    .font(.title)
                Text("There are built-in margins that are different to get around. Take a look at the color below so you can see where the margins are:")
                Color.purple
            }

            Section {
                Text("Summary")
                    .font(.title)
                Text("Pretty much what you see here is what you get.")
            }
        }
    }
}

struct FormIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        FormIntroduction()
    }
}
