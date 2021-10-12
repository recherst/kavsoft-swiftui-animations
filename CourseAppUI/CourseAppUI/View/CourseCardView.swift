//
//  CourseCardView.swift
//  CourseAppUI
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct CourseCardView: View {
    var course: Course
    var body: some View {
        VStack {
            VStack {
                Image(course.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .background(Color(course.asset))

                HStack {
                    VStack(alignment: .leading, spacing: 12, content: {
                        Text(course.name)
                            .font(.title3)

                        Text("\(course.numCourse) Courses")
                    })
                    .foregroundColor(.black)

                    Spacer(minLength: 0)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(15)

            Spacer(minLength: 0)
        }
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
