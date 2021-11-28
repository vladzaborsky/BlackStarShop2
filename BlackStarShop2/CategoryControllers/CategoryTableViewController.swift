//
//  CategoryTableViewController.swift
//  BlackStarShop2
//
//  Created by Vlad Zaborsky on 23.11.2021.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categoryObjectsFromJson: [Category] = []
    private let reuseCategoryCellIdentifier = "categoryCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        NetworkManager.shared.downloadCategoryData(url: Constants.categoriesUrl) { data in
            self.categoryObjectsFromJson = data
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        let nib = UINib(nibName: "CategoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseCategoryCellIdentifier)
    }
    
    // Setup views
    
    private func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Категории"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryObjectsFromJson.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCategoryCellIdentifier, for: indexPath) as! CategoryCell
        
        // get category object for each cell
        let categoryObject = categoryObjectsFromJson[indexPath.row]
        
        // set Category image
        if let categoryImagePath = categoryObject.iconImageActive {
            let imageUrl = Constants.baseUrl + categoryImagePath
            cell.setImageToTheCell(imageUrl)
        }
        
        // set Category name
        if let categoryName = categoryObject.name {
            cell.setTitleToTheCell(categoryName)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedCategory = categoryObjectsFromJson[indexPath.row].subcategories as NSArray
        let selectedCategoryName = categoryObjectsFromJson[indexPath.row].name!
        var selectedSubCat: [Subcategory] = []
        
        // Create Subcategory object in cycle and append in selectedSubCat
        for index in selectedCategory {
            if let subcategory = index as? NSDictionary {
                if let subcategoryObject = Subcategory(subcategoryData: subcategory as NSDictionary) {
                    selectedSubCat.append(subcategoryObject)
                }
            }
        }
        
        let subcategoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subcategoryController") as! SubcategoryTableViewController
        subcategoryVC.categoryName = selectedCategoryName
        subcategoryVC.selectedCategory = selectedSubCat
        navigationController?.pushViewController(subcategoryVC, animated: true)
    }
    
}


