//
//  Clothe.swift
//  FashionWise
//
//  Created by lizbeth.alejandro on 14/11/24.
//

import Foundation

struct Clothing: Identifiable {
    let id = UUID()
    let productName: String
    let amount: Double
    let date: Date
}
