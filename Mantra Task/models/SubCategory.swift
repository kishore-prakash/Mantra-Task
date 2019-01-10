//
//  SubCategory.swift
//  Mantra Task
//
//  Created by Kishore on 17/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import Foundation
import SwiftyJSON

class SubCategory {
    var name: String
    var displayName: String
    
    init() {
        name = String()
        displayName = String()
    }
    
    convenience init(json: JSON) {
        self.init()
        self.name = json["name"].stringValue
        self.displayName = json["display_name"].stringValue
    }
}
