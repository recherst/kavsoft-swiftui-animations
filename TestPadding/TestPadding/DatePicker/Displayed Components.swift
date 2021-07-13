//
//  Displayed Components.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct Displayed_Components: View {

    @State private var justTime = Date()
    @State private var theDateAndTime = Date()

    var body: some View {
        VStack(spacing: 9) {
            Text("DatePicker")
                .font(.largeTitle)
            Text("Displayed Components")
                .foregroundColor(.gray)

            Text("Show date and time parts with displayedComponents.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
            // Set different components or combine them.
            DatePicker("", selection: $justTime, displayedComponents: .hourAndMinute)

            Text("Combine date and time with an array.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .foregroundColor(.black)
            // Set different components or combine them.
            DatePicker("", selection: $theDateAndTime, displayedComponents: [.date, .hourAndMinute])
        }
        .font(.title)
        // Notice I can add this modifier to the parent to be applied to the children
        .labelsHidden()
    }
}

struct Displayed_Components_Previews: PreviewProvider {
    static var previews: some View {
        Displayed_Components()
    }
}
