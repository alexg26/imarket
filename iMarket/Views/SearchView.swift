//
//  SearchView.swift
//  iMarket
//
//  Created by Alex Gonzales on 8/27/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                //filler text
                TextField("What are you looking for?", text: $searchText)
                    .foregroundColor(.primary)
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .padding(.horizontal)
        }
        .padding(.top)
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        SearchView(searchText: $searchText)
    }
}
