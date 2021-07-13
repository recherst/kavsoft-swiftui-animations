//
//  Layout Priority.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/6.
//

import SwiftUI

// When using a horizontal stack with text views within it, there's a chance that
// text might truncate if you are not allowing them to wrap. In this case, you can
// prioritize which one will truncate last with layout priority. The default value
// is 0. The higher is number, the higher the priority to have enough space to not
// be truncated

struct Layout_Priority: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HStack")
            Text("Layout Priority")
                .foregroundColor(.gray)
                .font(.title)
            Text("Use the layoutPriority modifier to give priority to the space a view needs to show its content.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.orange)

            HStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    // Don't let text wrap
                    .lineLimit(1)
                Image("swift-logo")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("Brings Balance")
                    .font(.largeTitle)
                    // Truncate last
                    .layoutPriority(1)
            }
            .padding([.horizontal])
            Divider()
            HStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    // Truncate last
                    .layoutPriority(1)
                Image("swift-logo")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("Brings Balance")
                    .font(.largeTitle)
                    // Don't let text wrap
                    .lineLimit(1)
            }
            .padding(.horizontal)
        }
        .font(.largeTitle)
    }
}

struct Layout_Priority_Previews: PreviewProvider {
    static var previews: some View {
        Layout_Priority()
    }
}
