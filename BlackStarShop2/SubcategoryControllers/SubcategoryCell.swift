//
//  SubcategoryCell.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 26.11.2021.
//

import UIKit

class SubcategoryCell: UITableViewCell {
    
    @IBOutlet weak var subcategoryImage: UIImageView!
    @IBOutlet weak var subcategoryNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setTitleToTheCell(_ text: String) {
        self.subcategoryNameLabel.text = text
    }
    
    func setImageToTheCell(_ url: String) {
        
        NetworkManager.shared.downloadImage(url: url) { image in
            DispatchQueue.main.async {
                self.subcategoryImage.image = image
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
