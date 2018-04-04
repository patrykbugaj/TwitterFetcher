//
//  Currency.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation
import ObjectMapper

class Currency: Mappable {
    var currency: String?
    var code: String?
    var mid: Float?
    
    required convenience init?(map: Map) {
        self.init()
    }
    

    func mapping(map: Map) {
        currency <- map["currency"]
        code <- map["code"]
        mid <- map["mid"]
    }
}


