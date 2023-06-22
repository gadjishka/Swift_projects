//
//  ProductsResponse.swift
//  SwiftBookApp
//
//  Created by Гаджи Герейакаев on 20.06.2023.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable, Hashable {
    case courses = "Courses"
    case webinars = "Webinars"
}

struct ProductsResponse: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var shortName: String
    var category: Category
    var description: String
    var rating: Double
    var students: Int
    var lessons: Int
    var isFavorite: Bool
    var isFeatured: Bool
}
