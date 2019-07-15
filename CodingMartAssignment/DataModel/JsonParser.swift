//
//  JsonParser.swift
//  CodingMartAssignment
//
//  Created by iWizards XI on 13/07/19.
//  Copyright © 2019 iWizards XI. All rights reserved.
//

import Foundation

func parseJson() -> [JsonData] {
    var masterArr = [JsonData]()
    let url = Bundle.main.url(forResource: "file", withExtension: "json")!
    do {
        let jsonData = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: jsonData) as? [[String:AnyObject]]
        for item in json!{
            let val = JsonData(JSON: item)
            masterArr.append(val!)
        }
    }
    catch {
        print(error)
    }
    return masterArr
}
