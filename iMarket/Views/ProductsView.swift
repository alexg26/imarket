//
//  ProductsView.swift
//  iMarket
//
//  Created by Alex Gonzales on 8/27/24.
//

import SwiftUI

struct ProductsView: View {
    @StateObject private var viewModel = ProductsViewModel()
    @ObservedObject var cartViewModel: CartViewModel
    @State private var searchText: String = ""
   
    
    
    var body: some View {
        VStack {
            SearchView(searchText: $searchText)
                .onChange(of: searchText) { newValue in
                    viewModel.filterProducts(searchText: newValue)
                }
            
            Divider()
                .padding(.top, 5)
            
            ScrollView {
                ForEach(viewModel.filteredProducts) { product in
                    HStack {
                        AsyncImage(url: URL(string: product.thumbnail)) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        } placeholder: {
                            Rectangle()
                                .fill(Color(UIColor.systemGray4))
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading, spacing: 1) {
                            Text(product.title)
                                .font(.headline)
                                .lineLimit(1)
                                .foregroundColor(.primary)
                            
                            Text("$\(String(format: "%.2f", product.price))")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text(product.category.capitalized)
                                .font(.caption)
                                .padding(6)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(5)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            HStack {
                                Button(action: {
                                    cartViewModel.addToCart(product: product)
                                }) {
                                    Text("Add to Cart")
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 9)
                                        .background(Color(UIColor.systemBlue))
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                        
                                }
                            
                                
                                // heart buton w fill effect
                                FavoriteButton()
                            }
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color(UIColor.systemBackground).opacity(0.8))
                    .padding(.horizontal)
              
                }
            }
        }
       //when open should show products from dummy json
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}



//fill heart white
struct FavoriteButton: View {
    @State private var isFavorite = false
    
    var body: some View {
        Button(action: {
            isFavorite.toggle()
        }) {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .frame(width: 45, height: 45)
                .foregroundColor(isFavorite ? .white : .primary)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(200)
        }
    }
}





struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(cartViewModel: CartViewModel())
    }
}
