//
//  Product.swift
//  iMarket
//
//  Created by Alex Gonzales on 8/28/24.
//

import Foundation



struct ProductList: Codable {
    let products: [Product] //arr of prods
}

//defining product
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let category: String
    let thumbnail: String
}
