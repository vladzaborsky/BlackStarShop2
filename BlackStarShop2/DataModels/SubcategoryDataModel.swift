//
//  SubcategoryDataModel.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 25.11.2021.
//

import Foundation

class SubcategoryDataObject {
    
    var id: String?
    var iconImage: String?
    var sortOrder: String?
    var name: String?
    var type: String?
    
    init?(subcategoryData: NSDictionary) {
        guard let id = subcategoryData["id"] as? String,
              let iconImage = subcategoryData["iconImage"] as? String,
              let sortOrder = subcategoryData["sortOrder"] as? String,
              let name = subcategoryData["name"] as? String,
              let type = subcategoryData["type"] as? String
        else { return nil }
        
        self.id = id
        self.iconImage = iconImage
        self.sortOrder = sortOrder
        self.name = name
        self.type = type
    }
    
}
