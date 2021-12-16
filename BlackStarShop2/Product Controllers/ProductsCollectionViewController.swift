//
//  ProductsCollectionViewController.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 27.11.2021.
//

import UIKit

private let reuseIdentifier = "productCell"

class ProductsCollectionViewController: UICollectionViewController {
    
    var productID: String?
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        guard let unwrappedProductID = productID else { return }
    
        NetworkManager.shared.downloadProductsData(url: Constants.productsUrl + unwrappedProductID) { dataProducts
            in
            
            self.products = dataProducts
            
        }
        
        
        setupViews()
    }
    
    // MARK: Setup Views Function
    
    func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Register cell classes
        self.collectionView!.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
    
        return cell
    }

}

    // MARK: UICollectionViewDelegateFlowLayout

extension ProductsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 2
        
        return CGSize(width: width, height: width)
    }
}
