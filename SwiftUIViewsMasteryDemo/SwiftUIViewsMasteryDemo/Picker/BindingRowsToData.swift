//
//  BindingRowsToData.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct BindingRowsToData: View {
    @State private var youTuberName = "Mark"
    var youtubers = ["Sean", "Chris", "Mark", "Scott", "Paul"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Picker")
                .font(.largeTitle)
            Text("Binding to Data")
                .font(.title)
                .foregroundColor(.gray)
            Text("Use a ForEach with your Picker view to populate it with data.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("AccentColorDark"))
                .foregroundColor(Color.white)

            Text("Who do you want to watch today?")
                .padding(.bottom, 0)

            Picker(selection: $youTuberName, label: Text("")) {
                ForEach(youtubers, id: \.self) { name in
                    Row(name: name)
                }
            }
            .labelsHidden()
        }
        .font(.title)
    }
}

struct Row: View {
    var name: String

    var body: some View {
        HStack {
            Image(systemName: "person.fill")
            Text(name)
        }
        .tag(name)
    }
}

struct BindingRowsToData_Previews: PreviewProvider {
    static var previews: some View {
        BindingRowsToData()
    }
}
