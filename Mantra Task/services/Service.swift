//
//  Service.swift
//  Mantra Task
//
//  Created by Kishore on 17/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import Foundation
import SwiftyJSON

class Services {
    func getDataFromFile(fileName: String) -> JSON? {
        if let path = Bundle.main.path(forResource: "AllMenu", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                return try JSON(data: data)
            } catch _ {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func parseDataFromFile(fileName: String) -> [Category] {
        guard let jsonData = getDataFromFile(fileName: fileName) else {
            return []
        }
        var categories: [Category] = []
        for (_,subJson):(String, JSON) in jsonData {
            categories.append(Category(json: subJson))
        }
        return categories
    }
    
}
