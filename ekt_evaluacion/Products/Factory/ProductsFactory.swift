//
//  ProductsFactory.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 12/03/25.
//

import Foundation


class ProductsFactory {
    static func buildViewModel() -> HomeViewModel {
        let repository = ProductRepositoryImpl()
        let useCase = LoadProductsUsecaseImpl(repository: repository)
        
        return HomeViewModel(useCase: useCase)
    }
}
