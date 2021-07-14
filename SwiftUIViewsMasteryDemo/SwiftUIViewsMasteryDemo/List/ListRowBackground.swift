//
//  ListRowBackground.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    var action = ""
    var due = ""
    var isIndented = false
}

struct ListRowBackground: View {
    @State private var newToDo = ""

    @State var data = [
        Todo(action: "Practice Coding", due: "Today"),
        Todo(action: "Grocery shopping", due: "Today"),
        Todo(action: "Get tickets", due: "Tomorrow"),
        Todo(action: "Clean house", due: "Next Week"),
        Todo(action: "Do laundry", due: "Next Week"),
        Todo(action: "Cook dinner", due: "Next Week"),
        Todo(action: "Paint room", due: "Next Week")
    ]
    var body: some View {
        List {
            Section(
                header:
                    VStack {
                        Text("To Do")
                            .font(.title)
                        HStack {
                            TextField("new todo", text: $newToDo)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button(action: {
                                data.append(Todo(action: newToDo))
                                newToDo = ""
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                            })
                        }
                    }
                    .padding(
                        EdgeInsets(top: 50, leading: 16, bottom: 16, trailing: 16)
                    )
            ) {
                ForEach(data) { datum in
                    Text(datum.action)
                        .font(Font.system(size: 24))
                        .foregroundColor(getTextColor(due: datum.due))
                        // Turn row green if due today
                        .listRowBackground(datum.due == "Today" ? Color.green : Color.clear)
                        .padding()
                }
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }

    // This logic was inline but the compiler said it was "too complex" 🤷🏻‍♂️
    func getTextColor(due: String) -> Color {
        due == "Today" ? Color.black : Color.primary
    }
}

// Notice the .listRowBackground function is on the view inside the ForEach.
// You want to call this function on whatever view will be inside the row,
// not on the List itself.

struct ListRowBackground_Previews: PreviewProvider {
    static var previews: some View {
        ListRowBackground()
    }
}
