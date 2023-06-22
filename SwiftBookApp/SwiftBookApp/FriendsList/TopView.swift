//
//  TopView.swift
//  SwiftBookApp
//
//  Created by Гаджи Герейакаев on 20.06.2023.
//

import SwiftUI

struct TopView: View {
    
    var user: UserResponse
    var body: some View {
        HStack(spacing: 8.0) {
            Image(user.profileImage)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4.0) {
                Text(user.name)
                    .font(.title)
                HStack{
                    Text(user.email)
                        .font(.subheadline)
                    Spacer()
                    Image("like")
                    Text(user.likes)
                        .font(.subheadline)
                }
            }
        }
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(user: userResponse[0])
    }
}
