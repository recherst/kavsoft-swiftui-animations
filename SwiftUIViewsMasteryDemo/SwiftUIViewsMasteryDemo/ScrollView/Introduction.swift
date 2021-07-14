//
//  Introduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

// A ScrollView is like a container for child views. When the child views within the
// ScrollView go outside the frame, the user can scroll to bring the child views that
// are outside the frame into view.

// A ScrollView is a push-out view in the scroll direction you specify. You can set
// the direction of a ScrollView to be vertical or horizontal.

struct Introduction: View {
    @State private var names = ["Scott", "Mark", "Chris", "Sean", "Rod", "Meng", "Natasha", "Chase", "Evans", "Paul", "Durtschi", "Max"]
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                // Wrap the ForEach in a ScrollView
                ScrollView {
                    ForEach(names, id: \.self) { name in
                        NavigationLink(
                            destination: BookDetail(bookItem: name),
                            label: {
                                HStack {
                                    Text(name)
                                        .foregroundColor(.primary)
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(.green)
                                    Spacer()
                                    Image(systemName: "chevron.right.circle.fill")
                                }
                                .font(.system(size: 24, design: .rounded))
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 1, y: 1)
                            })
                    }
                    // Set the width on the ForEach (it's View)
                    .frame(width: geometry.size.width - 32)
                    .accentColor(Color.pink)
                    .padding()
                }
                .navigationBarTitle(Text("Cool People"))
            }
        }
    }
}

// A ScrollView with a ForEach view is similar to a List. But be warned, the rows
// are not reusable. it is best to limit the number of rows for memory and performance
// considerations.

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
