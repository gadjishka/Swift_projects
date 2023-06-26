//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Гаджи Герейакаев on 22.06.2023.
//

<<<<<<< HEAD
import RealmSwift
import UIKit
=======
import Foundation
>>>>>>> parent of 2337033 (Add Realm Framework)


class Place: Object {
    
<<<<<<< HEAD
    @Persisted var name: String = ""
    @Persisted var location: String?
    @Persisted var type: String?
    @Persisted var imageData: Data?
=======
    var name: String
    var location: String
    var type: String
    var image: String
>>>>>>> parent of 2337033 (Add Realm Framework)
    
    let restaurantNames = ["Траттория VABENE!", "ДжастаПаста", "Сабор де ла Вида Ресторан", "Любовь Пирогова", "АндерСон", "КТ Биро", "Джумбус", "Кафе Кусочки", "Боэми", "Стейк Хаус Бутчер"]
    
    func savePlaces() {
        
        for place in restaurantNames {
<<<<<<< HEAD
            
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else {return}
            
            let newPlace = Place()
            
            newPlace.name = place
            newPlace.location = "Moscow"
            newPlace.type = "Bar"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
=======
            places.append(Place(name: place, location: "Москва", type: "Ресторан", image: place))
>>>>>>> parent of 2337033 (Add Realm Framework)
        }
        
    }
}
