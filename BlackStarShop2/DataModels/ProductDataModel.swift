//
//  ProductDataModel.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 27.11.2021.
//

import Foundation

class Product {
    
    var name: String?
    var englishName: String?
    var sortOrder: String?
    var article: String?
    var collection: String?
    var description: String?
    var colorName: String?
    var colorImageURL: String?
    var mainImage: String?
    var productImage: Array<NSDictionary>?
    var offers: Array<NSDictionary>?
    var recommendedProductsIDs: [String]?
//    var instagramPhotos: [String]?
    var price: String?
    var attributes: Array<NSDictionary>
    
    init?(productData: NSDictionary) {
        guard let name = productData["name"] as? String,
              let englishName = productData["englishName"] as? String,
              let sortOrder = productData["sortOrder"] as? String,
              let article = productData["article"] as? String,
              let collection = productData["collection"] as? String,
              let description = productData["description"] as? String,
              let colorName = productData["colorName"] as? String,
              let colorImageURL = productData["colorImageURL"] as? String,
              let mainImage = productData["mainImage"] as? String,
              let productImage = productData["productImage"] as? Array<NSDictionary>,
              let offers = productData["offers"] as? Array<NSDictionary>,
              let recommendedProductsIDs = productData["recommendedProductsIDs"] as? [String],
              let price = productData["price"] as? String,
              let attributes = productData["attributes"] as? Array<NSDictionary>
        else { return nil }
        
        self.name = name
        self.englishName = englishName
        self.sortOrder = sortOrder
        self.article = article
        self.collection = collection
        self.description = description
        self.colorName = colorName
        self.colorImageURL = colorImageURL
        self.mainImage = mainImage
        self.productImage = productImage
        self.offers = offers
        self.recommendedProductsIDs = recommendedProductsIDs
        self.price = price
        self.attributes = attributes
    }
}
