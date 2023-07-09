//
//  test.swift
//  SwiftBookApp
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct test: View {
    @State private var testing = "var let put"
    
    var body: some View {
        if testing.contains("let") {
            return Text("Done")
        }
        else {
            return Text("No")
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
