//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Гаджи Герейакаев on 22.06.2023.
//

import Foundation

struct Place {
    
    var name: String
    var location: String
    var type: String
    var image: String
    
    static let restaurantNames = ["Траттория VABENE!", "ДжастаПаста", "Сабор де ла Вида Ресторан", "Любовь Пирогова", "АндерСон", "КТ Биро", "Джумбус", "Кафе Кусочки", "Боэми", "Стейк Хаус Бутчер"]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Москва", type: "Ресторан", image: place))
        }
        
        return places
    }
}
