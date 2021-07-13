//
//  NavigationBarBackButtonHidden.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/12.
//

import SwiftUI

struct NavigationBarBackButtonHidden: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3BackgroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                    Text("NavigationView")
                        .font(.largeTitle)
                    Text("Back Button Hidden")
                        .foregroundColor(.gray)
                    Image("NavBarBackButtonHidden")

                    // Use NavigationLink to navigate to a new screen.
//                    NavigationLink("Go To Detail", destination: BackButtonHiddenDetail())

                    NavigationLink("Go To Detail", destination: CustomBackButton())

                    Spacer()
                }
                .font(.title)
                .padding(.top, 70)
            }
            .navigationBarTitle(Text("Navigation Views"))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct BackButtonHiddenDetail: View {
    // This will allow you to navigate backward.
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color("Theme3BackgroundColor")
            VStack(spacing: 25) {
                Image(systemName: "globe")
                    .font(.largeTitle)
                Text("NaviagtionView")
                    .font(.largeTitle)
                Text("Back Button hidden")
                    .foregroundColor(.gray)
                Image("NavBarBackButtonHidden")
                Text("This nav bar has no back button because it was hidden on this view.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme3ForegroundColor"))
                    .foregroundColor(Color("Theme3BackgroundColor"))
                    .layoutPriority(1)

                Button("Go Back") {
                    // Dismissing what is being presented will navigate you back
                    // to the previous view.
                    presentationMode.wrappedValue.dismiss()
                }

                Spacer()
            }
            .font(.title)
            .padding(.top, 50)
        }
        .navigationBarTitle(Text("Detail View"), displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
        // Hide the back button
        .navigationBarBackButtonHidden(true)
    }
}

struct NavigationBarBackButtonHidden_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarBackButtonHidden()
    }
}
