//
//  ContentView.swift
//  iMarket
//
//  Created by Alex Gonzales on 8/27/24.
//

import SwiftUI

struct ContentView: View {
    //keep track cart items
    @StateObject private var cartViewModel = CartViewModel()
    
    var body: some View {
        TabView {
            ProductsView(cartViewModel: cartViewModel)
                .tabItem {Label("Products", systemImage: "carrot")}
            
            FavoritesView()
                .tabItem {Label("My Items", systemImage: "heart")}
            
            CartView(cartViewModel: cartViewModel)
                .tabItem {Label("Cart", systemImage: "cart.fill")}
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
