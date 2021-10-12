//
//  DetailView.swift
//  CourseAppUI
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct DetailView: View {
    var course: Course
    var body: some View {
        VStack {
            Text(course.name)
                .font(.title2)
                .fontWeight(.bold)
        }
        .navigationTitle(course.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {}, label: {
            Image(systemName: "menubar.rectangle")
                .font(.system(size: 22))
                .foregroundColor(.gray)
        }))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
