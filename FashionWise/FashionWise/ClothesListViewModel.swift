//
//  ClothesListViewModel.swift
//  FashionWise
//
//  Created by lizbeth.alejandro on 14/11/24.
//

import SwiftUI

@Observable
class ClothesListViewModel {
    var clothes: [Clothing] = []
    
    func addClothing(name: String, amount: Double, date: Date) {
        let newClothing = Clothing(productName: name, amount: amount, date: date)
        clothes.append(newClothing)
    }
    
    func deleteClothing(at index: IndexSet) {
        clothes.remove(atOffsets: index)
    }
}

