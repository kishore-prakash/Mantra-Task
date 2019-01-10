//
//  ViewController.swift
//  Mantra Task
//
//  Created by Kishore on 17/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var categories: [Category] = []
    @IBOutlet weak var categoriesTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = Services().parseDataFromFile(fileName: "AllMenu")
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categories[section].isOpened == true {
            return categories[section].subCategorys.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
            cell.textLabel?.text = categories[indexPath.section].name
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "subCategoryCell", for: indexPath) as? SubCategoryTVC else {
                return UITableViewCell()
            }
            cell.setupCell(subCategory: categories[indexPath.section].subCategorys[indexPath.row - 1])
            return cell
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if categories[indexPath.section].isOpened == true {
            categories[indexPath.section].isOpened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .automatic)
        } else {
            categories[indexPath.section].isOpened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .automatic)
        }
    }
}
