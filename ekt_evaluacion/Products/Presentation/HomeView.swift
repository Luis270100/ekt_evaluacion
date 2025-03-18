//
//  ProductsView.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 12/03/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ProductsFactory.buildViewModel()
    @State private var isShowingProductList = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if let product = viewModel.selectedProduct {
                    ProductCard(product: product)
                }
                Button("Ver Productos") {
                    isShowingProductList = true
                    Task {
                        await viewModel.fetchProducts()
                    }
                }
                .padding()
                .sheet(isPresented: $isShowingProductList) {
                    ProductListView(isShowingProductList: $isShowingProductList, viewModel: viewModel)
                }
            }
            .padding()
            .navigationTitle("Selecciona un Producto")
        }
    }
}

#Preview {
    HomeView()
}
