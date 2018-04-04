//
//  Data.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation
import ObjectMapper

class Data: Mappable {
    var table: String?
    var no: String?
    var effectiveDate: String?
    var rates: [Currency]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        table <- map["table"]
        no <- map["no"]
        effectiveDate <- map["effectiveDate"]
        rates <- map["rates"]
    }
}



