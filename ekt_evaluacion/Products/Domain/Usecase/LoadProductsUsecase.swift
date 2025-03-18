//
//  LoadProductsUsecase.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 12/03/25.
//

import Foundation


protocol LoadProductsUseCase {
    func loadProducts() async throws -> [Product]
}

class LoadProductsUsecaseImpl: LoadProductsUseCase {
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    
    func loadProducts() async throws -> [Product] {
        return try await repository.loadProducts()
    }
}
