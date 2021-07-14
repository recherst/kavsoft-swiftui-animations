//
//  CombinedModifiedText.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CombinedModifiedText: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Combining Text Views")
                .font(.title)
                .foregroundColor(.gray)
            HStack {
                Image("text")
                    .resizable()
                    .frame(width: 40, height: 40)
                Image(systemName: "plus")
                Image("text")
                    .resizable()
                    .frame(width: 40, height: 40)
            }

            Group {
                Text("You can ")
                    + Text("format").bold()
                    + Text(" different parts of your text by using the plus (+) symbol.")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)

            Group {
                Text("Here is another ")
                    + Text("example").foregroundColor(.red).underline()
                    + Text(" of how you might accomplish this. ")
                    + Text("Notice").foregroundColor(.purple).bold()
                    + Text(" the use of the Group view to add padding and line limit to all the text ")
                    + Text("as a whole").bold().italic()
            }
            .padding(.horizontal)
            .layoutPriority(1)

            Group {
                Text("You can also ").font(.title).fontWeight(.light)
                    + Text("combine")
                    + Text(" different font weights ").fontWeight(.black)
                    + Text("and different text styles!").font(.title).fontWeight(.ultraLight)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

// Although you see I'm wrapping my Text views in a Group, it is not required. I only do this
// so I can apply common modifiers to everything within the Group. See section on the Group view
// for more information.

struct CombinedModifiedText_Previews: PreviewProvider {
    static var previews: some View {
        CombinedModifiedText()
    }
}
