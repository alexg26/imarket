//
//  ProductsViewModel.swift
//  iMarket
//
//  Created by Alex Gonzales on 8/28/24.
//

import Foundation
import Combine //w data change over time/network req

//keep track of all prods/manages how accessed/filtered
class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    
    private var cancellable: AnyCancellable?
    
    func fetchProducts() {
        
      //implement sc -
        guard let url = URL(string: "https://dummyjson.com/products") else {
            print("url not work")
            return
        }
        //get data
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error w fetching: \(error)")
                return
            }

            guard let data = data else {
                print("did not get data")
                return
            }

            //try to decode data
            do {
                let decodedResponse = try JSONDecoder().decode(ProductList.self, from: data)
                DispatchQueue.main.async {
                    self.products = decodedResponse.products
                    self.filteredProducts = self.products //initially shows all prods until user searches
                }
            } catch {
                print("failed to decode json: \(error)") //error handeling
            }
        }.resume()
    }
    
    //filters prod list based on what search
    func filterProducts(searchText: String) {
        if searchText.isEmpty {
            filteredProducts = products
        } else {
            //check if what type matches either title or category
            filteredProducts = products.filter { product in
                product.title.lowercased().contains(searchText.lowercased()) ||
                product.category.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
