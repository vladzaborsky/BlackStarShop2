//
//  SubcategoryTableViewController.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 26.11.2021.
//

import UIKit

class SubcategoryTableViewController: UITableViewController {
    
    var categoryName: String?
    var selectedCategory: [Subcategory] = []
    private let subcategoryCellIdentifier = "subcategoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        let nib = UINib(nibName: "SubcategoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: subcategoryCellIdentifier)
    }
    
    private func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = categoryName // используй название категории из selectedRow
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedCategory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: subcategoryCellIdentifier, for: indexPath) as! SubcategoryCell
        
        let subcategoryObject = selectedCategory[indexPath.row]
        
        if let subcategoryName = subcategoryObject.name {
            cell.setTitleToTheCell(subcategoryName)
        }
        
        if let subcategoryImagePath = subcategoryObject.iconImage {
            let imageUrl = Constants.baseUrl + subcategoryImagePath
            cell.setImageToTheCell(imageUrl)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectedProductsID = selectedCategory[indexPath.row].id else { return }
        
        let productsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "productsController") as! ProductsCollectionViewController
        productsVC.productID = selectedProductsID
        navigationController?.pushViewController(productsVC, animated: true)
        
        
    }
}
