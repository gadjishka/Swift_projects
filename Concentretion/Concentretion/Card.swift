//
//  Card.swift
//  Concentretion
//
//  Created by Гаджи Герейакаев on 12.09.2022.
//

import Foundation


struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifiereNumber = 0
    
    static func identifierGeneretor() -> Int {
        identifiereNumber += 1
        return identifiereNumber
    }
    
    init() {
        self.identifier = Card.identifierGeneretor()
    }
    
}

