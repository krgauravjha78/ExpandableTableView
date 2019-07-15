//
//  DataParsing.swift
//  CodingMartAssignment
//
//  Created by iWizards XI on 13/07/19.
//  Copyright © 2019 iWizards XI. All rights reserved.
//

import Foundation
import ObjectMapper


struct JsonData : Mappable {
    public var name : String?
    public var sub_category : [Sub_Category]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        sub_category <- map["sub_category"]
    }
}

struct Sub_Category : Mappable {
    var name : String?
    var display_name : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        display_name <- map["display_name"]
    }
}
