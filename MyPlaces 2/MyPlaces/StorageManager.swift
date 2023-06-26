//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Гаджи Герейакаев on 26.06.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        try! realm.write {
            realm.delete(place)
        }
    }
 }
