//
//  GeometryReader Intro.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI


// it is difficult, if not impossible, to get the size of a view. This is where the GeometryReader comes in.

// The GeometryReader is similar to a push-out container view in that you can add
// child views to it. It will allow you to inspect and use properties that can help
// with positioning other views within in. You can access properties like height,
// width and safe area insets which can help you dynamically set the sizes of views
// within it so they look good on any size device.
struct GeometryReader_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("GeometryReader")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)

            Text("GeometryReader is container view that pushes out to fill up all available space. You use it to help with positioning items within it.")
                .font(.title)
                .padding()

            GeometryReader { geometry in
                Text("A container view that defines its content as a function of its own size and coordinate space.")
                    .font(.title)
                // iOS13 时是居中显示的
//                Text("Views center automatically inside the GeometryReader")
//                    .font(.title)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            .foregroundColor(.white)
            .background(Color.pink)
        }
    }
}

struct Geometry_Introduction_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_Intro()
    }
}
