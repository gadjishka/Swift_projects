//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Гаджи Герейакаев on 22.06.2023.
//

import RealmSwift
import UIKit


class Place: Object {
    
    @Persisted var name: String = ""
    @Persisted var location: String?
    @Persisted var type: String?
    @Persisted var imageData: Data?
    
    let restaurantNames = ["Траттория VABENE!", "ДжастаПаста", "Сабор де ла Вида Ресторан", "Любовь Пирогова", "АндерСон", "КТ Биро", "Джумбус", "Кафе Кусочки", "Боэми", "Стейк Хаус Бутчер"]
    
    func savePlaces() {
        
        for place in restaurantNames {
            
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else {return}
            
            let newPlace = Place()
            
            newPlace.name = place
            newPlace.location = "Moscow"
            newPlace.type = "Bar"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
        }
        
    }
    
}
