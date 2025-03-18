//
//  ProductListView.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 17/03/25.
//

import SwiftUI

struct ProductListView: View {
    @Binding var isShowingProductList: Bool
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        List(viewModel.products) { product in
            ProductCard(product: product)
                .onTapGesture {
                    viewModel.selectedProduct = product
                    isShowingProductList = false
                }
        }
        .navigationTitle("Productos")
    }
}

//#Preview {
//    ProductListView(
//        isShowingProductList: $false, viewModel: HomeViewModel(useCase: LoadProductsUsecaseImpl(repository: ProductRepositoryImpl()))
//    )
//}
