//
//  HomeEntity.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import Foundation

struct Product {
    let productName: String
    let productImage: String
    let productPrice: Int
}

struct ProductsMockData {
    static let products: [Product] = [
        Product(productName: "Product 1", productImage: "product", productPrice: 10000),
        Product(productName: "Product 2", productImage: "product", productPrice: 11000),
        Product(productName: "Product 3", productImage: "product", productPrice: 12000),
        Product(productName: "Product 4", productImage: "product", productPrice: 13000),
        Product(productName: "Product 5", productImage: "product", productPrice: 14000),
    ]
}

enum ProductsError: Error {
    case invalidResponse
    case invalidData
    case unknownError
}
