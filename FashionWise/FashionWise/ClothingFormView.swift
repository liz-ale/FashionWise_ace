//
//  FormClothingView.swift
//  FashionWise
//
//  Created by lizbeth.alejandro on 14/11/24.
//

import SwiftUI

struct ClothingFormView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: ClothesListViewModel
    
    @State private var name = ""
    @State private var amountText = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Clothing Info")) {
                    TextField("Name", text: $name)
                    TextField("Price", text: $amountText)
                        .keyboardType(.decimalPad)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
            }
            .navigationTitle("Add Clothing")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let amount = Double(amountText) {
                            viewModel.addClothing(name: name, amount: amount, date: date)
                            dismiss()
                        }
                    }
                    .disabled(name.isEmpty || amountText.isEmpty)
                }
            }
        }
    }
}
