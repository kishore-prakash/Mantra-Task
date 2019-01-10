//
//  Category.swift
//  Mantra Task
//
//  Created by Kishore on 17/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category {
    var name: String
    var subCategorys: [SubCategory]
    var isOpened = false
    
    init() {
        name = String()
        subCategorys = []
    }
    
    convenience init(json: JSON) {
        self.init()
        self.name = json["name"].stringValue
        for (_,subJson):(String, JSON) in json["sub_category"] {
            self.subCategorys.append(SubCategory(json: subJson))
        }
    }
}
