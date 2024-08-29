//
//  CartView.swift
//  iMarket
//
//  Created by Alex Gonzales on 8/27/24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            VStack {
           
                List {
                    ForEach(cartViewModel.cartItems) { product in
                        HStack {
                            AsyncImage(url: URL(string: product.thumbnail)) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(5)
                            } placeholder: {
                                Rectangle()
                                    .fill(Color(UIColor.systemGray4))
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(5)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(product.title)
                                    .font(.body)
                                    .lineLimit(1)
                            }
                            .padding(.leading, 8)
                            
                            Spacer()
                            
                            Text("$\(String(format: "%.2f", product.price))")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(PlainListStyle())
                
        
    Divider()
                
           
                VStack(alignment: .leading, spacing: 8) {
                    Text("$\(String(format: "%.2f", cartViewModel.totalPrice)) total")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("\(cartViewModel.cartItems.count) items")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
             
                Button(action: {
     
                }) {
                    Text("Check out")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(11)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .navigationTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cartViewModel: CartViewModel())
    }
}
