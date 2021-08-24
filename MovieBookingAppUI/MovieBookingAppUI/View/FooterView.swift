//
//  FooterView.swift
//  MovieBookingAppUI
//
//  Created by recherst on 2021/8/25.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        NavigationLink(
            destination: BookingView(),
            label: {
                Text("Buy Ticket")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: rect.width / 2)
                    .background(Color("button"))
                    .cornerRadius(15)
            })
            .shadow(color: Color.white.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(0.15), radius: 5, x: -5, y: -5)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
