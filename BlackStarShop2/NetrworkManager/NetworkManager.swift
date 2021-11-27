//
//  NetworkManager.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 24.11.2021.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var imageCache = NSCache<NSString, UIImage>()
    
    //MARK: - Download Data Method
    
    func downloadData(url: String, completion: @escaping ([CategoryDataObject]) -> Void ) {
        
        let url = URL(string: url) // переводим string в URL
        guard let safeDataUrl = url else { return } // проверяем, что URL существует (безопасный)
        let request = URLRequest(url: safeDataUrl) // создаем запрос
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return } // извлекаем полученную data, если она там есть
            
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let jsonDictionary = json as? NSDictionary {
                var arrayOfCategoryData: [CategoryDataObject] = []
                for (_, category) in jsonDictionary {
                    if let categoryObject = CategoryDataObject(data: category as! NSDictionary) {
                        arrayOfCategoryData.append(categoryObject)
                    }
                }
                completion(arrayOfCategoryData)
            }
        }
        task.resume()
    }
    
    //MARK: - Download Images Method
    
    func downloadImage(url: String, completion: @escaping (UIImage) -> Void) {
        
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            completion(cachedImage)
        } else {
            guard let safeImageUrl = URL(string: url) else { return }
            let request = URLRequest(url: safeImageUrl)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let gotData = data else { return }
                
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    guard let image = UIImage(data: gotData) else { return }
                    self.imageCache.setObject(image, forKey: url as NSString)
                    completion(image)
                }
            }
            task.resume()
        }
    }
}
