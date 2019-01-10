//
//  SubCategoryTVC.swift
//  Mantra Task
//
//  Created by Kishore on 17/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import UIKit

class SubCategoryTVC: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(subCategory: SubCategory) {
        nameLabel.text = subCategory.name
        descriptionLabel.text = subCategory.displayName
    }

}
