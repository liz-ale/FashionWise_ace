//
//  ContentView.swift
//  FashionWise
//
//  Created by lizbeth.alejandro on 14/11/24.
//
import SwiftUI

struct ContentView: View {
    private var viewModel = ClothesListViewModel()
    @State private var showForm = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.clothes) { clothing in
                    HStack {
                        Text(clothing.productName)
                            .font(.headline)
                        Spacer()
                        Text("$\(clothing.amount, specifier: "%.2f")")
                            .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: viewModel.deleteClothing)
            }
            .navigationTitle("Clothing List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showForm = true
                    }
                }
            }
            .sheet(isPresented: $showForm) {
                ClothingFormView(viewModel: viewModel)
                    .presentationDetents([.medium])
            }
        }
    }
}


#Preview {
    ContentView()
}
