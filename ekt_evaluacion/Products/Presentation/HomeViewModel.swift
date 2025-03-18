//
//  HomeViewModel.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 17/03/25.
//

import Foundation



class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var selectedProduct: Product?
    
    
    init(useCase: LoadProductsUseCase) {
        self.useCase = useCase
    }
    
    private let useCase: LoadProductsUseCase
    
    func fetchProducts() async {
        do {
            let fetchProducts = try await useCase.loadProducts()
            
            DispatchQueue.main.async {
                self.products = fetchProducts
            }
        } catch {
            print("Loading error")
        }
    }
}
