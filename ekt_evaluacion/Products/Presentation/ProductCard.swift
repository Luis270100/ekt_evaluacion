//
//  ProductCard.swift
//  ekt_evaluacion
//
//  Created by Luis Arturo Hernandez Espinosa on 17/03/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.urlImagenes.first ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .cornerRadius(10)
            Text(product.nombre)
                .font(.headline)
            Text("\(product.precioFinal, specifier: "%.2f")")
                .font(.subheadline)
            Text("Categoría: \(product.codigoCategoria)")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ProductCard(product: Product(id: "000", sku: "1234", nombre: "Audifonos", precioRegular: 123.30, precioFinal: 1324.34, porcentajeDescuento: 10, descuento: false, precioCredito: 33.33, montoDescuento: 22.33, urlImagenes: [""], codigoCategoria: "MA"))
}
