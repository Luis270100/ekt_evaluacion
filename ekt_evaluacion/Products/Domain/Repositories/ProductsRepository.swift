//
//  ProductsRepository.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 12/03/25.
//

import Foundation


protocol ProductRepository {
    func loadProducts() async throws -> [Product]
}
