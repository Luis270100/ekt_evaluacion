//
//  Reponse.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 18/03/25.
//

import Foundation


struct RespuestaAPI: Codable {
    let mensaje: String
    let advertencia: String
    let resultado: Resultado
}

struct Resultado: Codable {
    let paginacion: Paginacion
    let categoria: String
    let productos: [Product]
}

struct Paginacion: Codable {
    let pagina: Int
    let totalPaginas: Int
    let totalRegistros: Int
    let totalRegistrosPorPagina: Int
}
