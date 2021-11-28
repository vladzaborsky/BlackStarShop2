//
//  ProductCollectionViewCell.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 27.11.2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productBuyButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupProductImageSetting()
        setupProductButtonSettings()
    }
    
    func setText() {
        
    }
    
    func setImages() {
        
    }
    
    private func setupProductImageSetting() {
        productImageView.contentMode = .scaleAspectFit
    }
    
    private func setupProductButtonSettings() {
        productBuyButton.layer.cornerRadius = productBuyButton.frame.width / 2
    }
    
    

}
