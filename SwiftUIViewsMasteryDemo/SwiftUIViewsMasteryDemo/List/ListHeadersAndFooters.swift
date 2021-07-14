//
//  ListHeadersAndFooters.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

struct ListHeadersAndFooters: View {
    var data = ["Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Rodrigo"]
    var body: some View {
        List {
            Section(
                header: Header(),
                footer: Text("7 People on Staff")
            ) {
                // ForEach will handle the row creation within the section
                ForEach(data, id: \.self) { datum in
                    NameRow(content: datum)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct Header: View {
    var body: some View {
        Image("mountains")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width)
            .overlay(
                Text("STAFF")
                    .font(Font.system(size: 120, design: Font.Design.serif))
                    .foregroundColor(.green)
            )
    }
}

struct NameRow: View {
    var content: String
    var body: some View {
        HStack {
            Image("PineTree")
                .resizable()
                // In order to set a foregroundColor on an image("PineTree"),
                // that image has to be set to render as a template image.
//                .renderingMode(.template)
                .foregroundColor(Color.green)
                .frame(width: 40, height: 40)
            Text(content)
            Spacer()
        }
        .padding()
    }
}

struct ListHeadersAndFooters_Previews: PreviewProvider {
    static var previews: some View {
        ListHeadersAndFooters()
            .preferredColorScheme(.dark)
    }
}
