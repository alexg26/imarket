//
//  CartViewModel.swift
//  iMarket
//
//  Created by Alex Gonzales on 8/28/24.
//

//manager for shopping cart (keep track of stuff added)
import Foundation

class CartViewModel: ObservableObject {
    //array holds items of type product ie food/perfume
    @Published var cartItems: [Product] = []
    
    //calc total price of stuff in cart, starting at 0
    //loop goes thru each item in cart, adds up price and gives total
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.price }
    }
    
    //add new product to cart
    func addToCart(product: Product) {
        cartItems.append(product)
    }
}
