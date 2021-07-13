//
//  CustomBackButton.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/12.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color("Theme3BackgroundColor")
            VStack(spacing: 25) {
                Image(systemName: "globe")
                Text("NavigationView")
                    .font(.largeTitle)
                Text("Custom Back Button")
                    .foregroundColor(.gray)
                Text("Hide the system back button and then use the navigation bar items modifier to add your own.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme3ForegroundColor"))
                    .foregroundColor(Color("Theme3BackgroundColor"))
                    .layoutPriority(1)

                Spacer()

            }
            .font(.title)
            .padding(.top, 50)
        }
        .navigationBarTitle(Text("Detail View"), displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                // Custom back button
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Text("Go Back")
                }
            })
        )
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton()
    }
}
