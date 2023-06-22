//
//  ContentView.swift
//  SwiftBookApp
//
//  Created by Гаджи Герейакаев on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    var categories: [String: [ProductsResponse]] {
            .init(
                grouping: materialResponse,
                by: { $0.category.rawValue }
            )
        }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(self.categories.keys.sorted(), id: \.self) { key in
                    ProductRow(categoryName: key, items: self.categories[key]!)
                    
                }
            }
            .navigationTitle(Text("Homepage"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
