//
//  Product.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 12/03/25.
//

import Foundation



struct Product: Codable, Identifiable {
    let id: String
    let sku: String
    let nombre: String
    let precioRegular: Double
    let precioFinal: Double
    let porcentajeDescuento: Double
    let descuento: Bool
    let precioCredito: Double
    let montoDescuento: Double
    let urlImagenes: [String]
    let codigoCategoria: String
}
