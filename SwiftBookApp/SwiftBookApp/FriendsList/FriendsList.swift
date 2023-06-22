//
//  FriendsList.swift
//  SwiftBookApp
//
//  Created by Гаджи Герейакаев on 20.06.2023.
//

import SwiftUI

struct FriendsList: View {
    var body: some View {
        NavigationView{
            List(userResponse){ user in
                Cell(user: user)
            }
            .navigationBarTitle(Text("Friends"))
        }
        
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
