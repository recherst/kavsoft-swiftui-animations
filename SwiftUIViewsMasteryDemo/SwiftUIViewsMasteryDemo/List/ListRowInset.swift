//
//  ListRowInset.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

struct ListRowInset: View {

    @State private var newToDo = ""

    @State var data = [
        Todo(action: "Practice using List Row Insets", due: ""),
        Todo(action: "Grocery shopping", due: "Today"),
        Todo(action: "Vegetables", due: "Today", isIndented: true),
        Todo(action: "Spices", due: "Today", isIndented: true),
        Todo(action: "Cook dinner", due: "Next Week"),
        Todo(action: "Paint room", due: "Next Week")
    ]

    var body: some View {
        GeometryReader { gr in
            List {
                Section(
                    header:
                        VStack {
                            Text("To Do")
                                .font(.title)
                                .foregroundColor(.white)
                            HStack {
                                TextField("new todo", text: $newToDo)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    data.append(Todo(action: newToDo))
                                    newToDo = ""
                                }, label: {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                })
                            }
                        }
                        .padding(EdgeInsets(top: 50, leading: 26, bottom: 16, trailing: 16))
                        .background(Color.green)
                        .frame(width: gr.size.width)
                ) {
                    ForEach(data) { datum in
                        Text(datum.action)
                            .font(.title)
                            .padding()
                            .listRowInsets(
                                EdgeInsets(top: 0, leading: datum.isIndented ? 60 : 20, bottom: 0, trailing: 0)
                            )
                    }
                }
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct ListRowInset_Previews: PreviewProvider {
    static var previews: some View {
        ListRowInset()
    }
}
