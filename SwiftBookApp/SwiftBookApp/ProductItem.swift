//
//  ProductItem.swift
//  SwiftBookApp
//
//  Created by Гаджи Герейакаев on 20.06.2023.
//

import SwiftUI

struct ProductItem: View {
    
    var object: ProductsResponse
    
    var body: some View {
        VStack {
            Image(object.image)
                .resizable()
                .cornerRadius(10)
                .frame(width: 170, height: 170)
        }.padding(.leading, 15)
        
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(object: materialResponse[0])
    }
}
