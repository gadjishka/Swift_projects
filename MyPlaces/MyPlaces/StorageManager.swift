//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Гаджи Герейакаев on 23.06.2023.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ place: Place) {
        try! realm.write{
            realm.add(place)
        }
    }
}
