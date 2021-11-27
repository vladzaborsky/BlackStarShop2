//
//  CategoryDataModel.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 24.11.2021.
//

import Foundation

class Category {
    
    var name: String?
    var sortOrder: String?
    var image: String?
    var iconImage: String?
    var iconImageActive: String?
    var subcategories: Array<NSDictionary>
    
    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let image = data["image"] as? String,
              let iconImage = data["iconImage"] as? String,
              let iconImageActive = data["iconImageActive"] as? String,
              let subcategories = data["subcategories"] as? Array<NSDictionary>
        else { return nil }

        self.name = name
        self.sortOrder = sortOrder
        self.image = image
        self.iconImage = iconImage
        self.iconImageActive = iconImageActive
        self.subcategories = subcategories
    }
}
