//
//  CategoryCell.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 23.11.2021.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImage.contentMode = .scaleAspectFit
    }
    
    func setTitleToTheCell(_ text: String) {
        self.categoryNameLabel.text = text
    }
    
    func setImageToTheCell(_ url: String) {
        
        NetworkManager.shared.downloadImage(url: url) { image in
            DispatchQueue.main.async {
                self.categoryImage.image = image
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
