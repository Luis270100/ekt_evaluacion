//
//  ProductRepositoryImpl.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 12/03/25.
//

import Foundation


class ProductRepositoryImpl : ProductRepository {
    
    func loadProducts() async throws -> [Product] {
        guard let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let response = try JSONDecoder().decode(RespuestaAPI.self, from: data)
            print(response)
            
            return response.resultado.productos
        } catch {
            print("Error al decodificar los datos: \(error)")
            throw error
        }
    }
}


//`{
//  "mensaje": "OperaciÃ³n Exitosa.",
//  "advertencia": "Se recomienda el uso adecuado de la aplicaciÃ³n, cualquier uso indebido serÃ¡ sancionado.",
//  "resultado": {
//    "paginacion": {
//      "pagina": 1,
//      "totalPaginas": 1,
//      "totalRegistros": 13,
//      "totalRegistrosPorPagina": 13
//    },
//    "categoria": "todos",
//    "productos": [
//      {
//        "id": "1009286",
//        "idLinea": 5,
//        "codigoCategoria": "C",
//        "idModalidad": 21,
//        "relevancia": 0,
//        "lineaCredito": "",
//        "pagoSemanalPrincipal": 119,
//        "plazoPrincipal": 96,
//        "disponibleCredito": true,
//        "abonosSemanales": [
//          {
//            "plazo": 156,
//            "montoAbono": 156,
//            "montoDescuentoAbono": 119,
//            "montoUltimoAbono": 187,
//            "montoFinalCredito": 13530,
//            "idPromocion": 1,
//            "montoDescuentoElektra": 10,
//            "montoDescuentoBanco": 10,
//            "precio": 6999,
//            "montoAbonoDigital": 187
//          }
//        ],
//        "sku": "1009286",
//        "nombre": "Pantalla LED HKPro 32'' HD Smart TV HKP32SM8",
//        "urlImagenes": [
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1141189/1009286.jpg?v=637691369840400000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1141190/1009286-d1.jpg?v=637691370447900000"
//        ],
//        "precioRegular": 6000,
//        "precioFinal": 5000,
//        "porcentajeDescuento": 16.666666666666657,
//        "descuento": true,
//        "precioCredito": 5000,
//        "montoDescuento": 1000
//      },
//      {
//        "id": "31042911",
//        "idLinea": 0,
//        "codigoCategoria": "TL",
//        "idModalidad": 23,
//        "relevancia": 0,
//        "lineaCredito": "",
//        "pagoSemanalPrincipal": 128,
//        "plazoPrincipal": 96,
//        "disponibleCredito": false,
//        "abonosSemanales": [
//          {
//            "plazo": 96,
//            "montoAbono": 96,
//            "montoDescuentoAbono": 128,
//            "montoUltimoAbono": 179,
//            "montoFinalCredito": 14578,
//            "idPromocion": 1,
//            "montoDescuentoElektra": 10,
//            "montoDescuentoBanco": 10,
//            "precio": 7499,
//            "montoAbonoDigital": 179
//          }
//        ],
//        "sku": "31042911",
//        "nombre": "Motorola Moto G9 Play 64 GB Azul ElÃ©ctrico + AudÃ­fonos",
//        "urlImagenes": [
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1140189/31042911.jpg?v=637461696481900000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1140190/31042911-d1.jpg?v=637461696622770000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1140191/31042911-d2.jpg?v=637461696751830000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1140192/31042911-d3.jpg?v=637461696881830000"
//        ],
//        "precioRegular": 5599,
//        "precioFinal": 5599,
//        "porcentajeDescuento": 0,
//        "descuento": false,
//        "precioCredito": 5599,
//        "montoDescuento": 0
//      },
//      {
//        "id": "34004593",
//        "idLinea": 100,
//        "codigoCategoria": "MA",
//        "idModalidad": 22,
//        "relevancia": 0,
//        "pagoSemanalPrincipal": 289,
//        "plazoPrincipal": 128,
//        "disponibleCredito": true,
//        "abonosSemanales": [
//          {
//            "plazo": 128,
//            "montoAbono": 128,
//            "montoDescuentoAbono": 260,
//            "montoUltimoAbono": 304,
//            "montoFinalCredito": 43755,
//            "idPromocion": 1,
//            "montoDescuentoElektra": 10,
//            "montoDescuentoBanco": 10,
//            "precio": 19999,
//            "montoAbonoDigital": 304
//          }
//        ],
//        "sku": "34004593",
//        "nombre": "Motocicleta de Trabajo Italika DT110 Delivery Blanca",
//        "urlImagenes": [
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1141226/34004593.jpg?v=637708814392530000"
//        ],
//        "precioRegular": 16999,
//        "precioFinal": 16999,
//        "porcentajeDescuento": 0,
//        "descuento": false,
//        "precioCredito": 16999,
//        "montoDescuento": 0
//      },
//      
//      {
//        "id": "34004283",
//        "idLinea": 100,
//        "codigoCategoria": "MA",
//        "idModalidad": 22,
//        "relevancia": 4,
//        "pagoSemanalPrincipal": 117,
//        "plazoPrincipal": 128,
//        "disponibleCredito": true,
//        "abonosSemanales": [
//          {
//            "plazo": 154,
//            "montoAbono": 154,
//            "montoDescuentoAbono": 300,
//            "montoUltimoAbono": 346,
//            "montoFinalCredito": 54707,
//            "idPromocion": 1,
//            "montoDescuentoElektra": 10,
//            "montoDescuentoBanco": 10,
//            "precio": 28999,
//            "montoAbonoDigital": 346
//          },
//          {
//            "plazo": 128,
//            "montoAbono": 135,
//            "montoDescuentoAbono": 117,
//            "montoUltimoAbono": 135,
//            "montoFinalCredito": 17414,
//            "idPromocion": 34,
//            "montoDescuentoElektra": 0,
//            "montoDescuentoBanco": 0,
//            "precio": 6000,
//            "montoAbonoDigital": 115
//          },
//          {
//            "plazo": 102,
//            "montoAbono": 148,
//            "montoDescuentoAbono": 128,
//            "montoUltimoAbono": 148,
//            "montoFinalCredito": 15243,
//            "idPromocion": 34,
//            "montoDescuentoElektra": 0,
//            "montoDescuentoBanco": 0,
//            "precio": 6000,
//            "montoAbonoDigital": 126
//          }
//        ],
//        "sku": "34004283",
//        "nombre": "Motocicleta Doble PropÃ³sito Italika DM250 Azul",
//        "urlImagenes": [
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139675/34004283.jpg?v=637375228050530000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139676/34004283-d1.jpg?v=637375228155830000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139677/34004283-d2.jpg?v=637375228265200000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139678/34004283-d3.jpg?v=637375228370030000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139679/34004283-d4.jpg?v=637375228482270000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139680/34004283-d5.jpg?v=637375230097730000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139681/34004283-d6.jpg?v=637375230455630000"
//        ],
//        "precioRegular": 6000,
//        "precioFinal": 6000,
//        "porcentajeDescuento": 0,
//        "descuento": false,
//        "precioCredito": 5000,
//        "montoDescuento": 0
//      },
//      {
//        "id": "34004256",
//        "idLinea": 100,
//        "codigoCategoria": "MA",
//        "idModalidad": 22,
//        "relevancia": 5,
//        "pagoSemanalPrincipal": 470,
//        "plazoPrincipal": 154,
//        "disponibleCredito": true,
//        "abonosSemanales": [
//          {
//            "plazo": 154,
//            "montoAbono": 154,
//            "montoDescuentoAbono": 300,
//            "montoUltimoAbono": 345,
//            "montoFinalCredito": 54706,
//            "idPromocion": 1,
//            "montoDescuentoElektra": 10,
//            "montoDescuentoBanco": 10,
//            "precio": 26499,
//            "montoAbonoDigital": 345
//          },
//          {
//            "plazo": 154,
//            "montoAbono": 544,
//            "montoDescuentoAbono": 470,
//            "montoUltimoAbono": 553,
//            "montoFinalCredito": 84328,
//            "idPromocion": 34,
//            "montoDescuentoElektra": 0,
//            "montoDescuentoBanco": 0,
//            "precio": 29999,
//            "montoAbonoDigital": 463
//          },
//          {
//            "plazo": 142,
//            "montoAbono": 564,
//            "montoDescuentoAbono": 486,
//            "montoUltimoAbono": 547,
//            "montoFinalCredito": 80634,
//            "idPromocion": 34,
//            "montoDescuentoElektra": 0,
//            "montoDescuentoBanco": 0,
//            "precio": 29999,
//            "montoAbonoDigital": 479
//          }
//        ],
//        "sku": "34004256",
//        "nombre": "Motocicleta Doble PropÃ³sito Italika DM200 Amarilla",
//        "urlImagenes": [
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139637/34004256.jpg?v=637375168340300000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139638/34004256-d1.jpg?v=637375168464500000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139639/34004256-d3.jpg?v=637375168586430000",
//          "https://elektraqa.vteximg.com.br/arquivos/ids/1139640/34004256-d2.jpg?v=637375168701600000"
//        ],
//        "precioRegular": 29999,
//        "precioFinal": 29999,
//        "porcentajeDescuento": 0,
//        "descuento": false,
//        "precioCredito": 30999,
//        "montoDescuento": 0
//      }
//    ]
//  }
//}
