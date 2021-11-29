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
    var description: String?
    var colorName: String?
    var colorImageURL: String?
    var mainImage: String?
    var productImages: Array<NSDictionary>?
    var offers: Array<NSDictionary>?
    var recommendedProductIDs: [String]?
//    var instagramPhotos: [String]?
    var price: String?
    var attributes: Array<NSDictionary>
    
    init?(productData: NSDictionary) {
        guard let name = productData["name"] as? String,
              let englishName = productData["englishName"] as? String,
              let sortOrder = productData["sortOrder"] as? String,
              let article = productData["article"] as? String,
              let description = productData["description"] as? String,
              let colorName = productData["colorName"] as? String,
              let colorImageURL = productData["colorImageURL"] as? String,
              let mainImage = productData["mainImage"] as? String,
              let productImage = productData["productImages"] as? Array<NSDictionary>,
              let offers = productData["offers"] as? Array<NSDictionary>,
              let recommendedProductsIDs = productData["recommendedProductIDs"] as? [String],
              let price = productData["price"] as? String,
              let attributes = productData["attributes"] as? Array<NSDictionary>
        else { return nil }
        
        self.name = name
        self.englishName = englishName
        self.sortOrder = sortOrder
        self.article = article
        self.description = description
        self.colorName = colorName
        self.colorImageURL = colorImageURL
        self.mainImage = mainImage
        self.productImages = productImage
        self.offers = offers
        self.recommendedProductIDs = recommendedProductsIDs
        self.price = price
        self.attributes = attributes
    }
}
