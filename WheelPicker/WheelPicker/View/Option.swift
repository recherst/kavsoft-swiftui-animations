//
//  Option.swift
//  WheelPicker
//
//  Created by recherst on 2021/10/1.
//

import SwiftUI

struct Option: View {
    var image: String
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(.white)
        })
    }
}

struct Option_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
