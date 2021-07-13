//
//  Form a Specific Date or Time.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct Form_a_Specific_Date_or_Time: View {

    @State private var arrivalDate = Date()

    let fromToday = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!

    let mainColor = Color("AccentColorDark")

    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker")
                .font(.largeTitle)
            Text("From Date or Time")
                .foregroundColor(.gray)
            Text("You can set a starting date or time with the date picker")
                .frame(maxWidth: .infinity)
                .padding()
                .background(mainColor)
                .foregroundColor(.white)
            Image("banff")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Arrival Date")
            DatePicker("", selection: $arrivalDate, in: fromToday..., displayedComponents: .date)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(mainColor)
                )
                .padding(.horizontal)
                .labelsHidden()
            Spacer()
        }
        .font(.title)
    }
}

struct Form_a_Specific_Date_or_Time_Previews: PreviewProvider {
    static var previews: some View {
        Form_a_Specific_Date_or_Time()
            .preferredColorScheme(.dark)
    }
}
