//
//  ContentView.swift
//  LoginUIWithAnimation
//
//  Created by recherst on 2021/9/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Login()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
