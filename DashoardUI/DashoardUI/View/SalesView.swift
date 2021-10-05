//
//  SalesView.swift
//  DashoardUI
//
//  Created by recherst on 2021/10/6.
//

import SwiftUI

struct SalesView: View {
    var sale: Sales
    var body: some View {
        ZStack {

            HStack {
                VStack(alignment: .leading, spacing: 22, content: {
                    Text(sale.title)
                        .foregroundColor(.white)

                    Text(sale.value)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })

                Spacer(minLength: 0)
            }
            .padding()
        }
        .background(sale.color)
        .cornerRadius(10)
    }
}

