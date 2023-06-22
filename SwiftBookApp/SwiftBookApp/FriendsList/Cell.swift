//
//  Cell.swift
//  SwiftBookApp
//
//  Created by Гаджи Герейакаев on 20.06.2023.
//

import SwiftUI

struct Cell: View {
    
    var user: UserResponse
    
    var body: some View {
        VStack(spacing: 16.0){
            TopView(user: user)
            Text(user.text)
                .lineLimit(nil)
        }.padding()
        
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(user: userResponse[0])
    }
}
