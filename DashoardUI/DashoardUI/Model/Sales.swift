//
//  Sales.swift
//  DashoardUI
//
//  Created by recherst on 2021/10/6.
//

import SwiftUI

struct Sales: Identifiable {
    var id = UUID().uuidString
    var title: String
    var value: String
    var color: Color
}


var salesData = [
    Sales(title: "Sold", value: "18,789", color: Color.orange),
    Sales(title: "Returned", value: "1,089", color: Color.red),
    Sales(title: "Delivered", value: "8,500", color: Color.blue),
    Sales(title: "Transit", value: "2,000", color: Color.pink),
    Sales(title: "Cancelled", value: "1,700", color: Color.purple),
]
