//
//  Previews_Devices.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/4.
//

import SwiftUI

struct Previews_Devices: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews")
                .font(.largeTitle)
            Text("Change Devices")
                .foregroundColor(.gray)
            Text("By Default, your canvas will use the simulator you currently have selected(upper left in Xcode). You can preview a different device using the previewDevice modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
        }
    }
}

struct Previews_Devices_Previews: PreviewProvider {
    static var previews: some View {
        Previews_Devices()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
        // How do I know what to type for a device?
        // Just look at your list of simulators and type in exactly as you see them displayed in the list.
    }
}
