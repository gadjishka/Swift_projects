//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Alexey Efimov on 15/11/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import RealmSwift
import UIKit

class Place: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var date = Date()
    
    convenience init(name: String = "", location: String? = nil, type: String? = nil, imageData: Data? = nil) {
        self.init()
        self.name = name
        self.location = location
        self.type = type
        self.imageData = imageData
    }
}
