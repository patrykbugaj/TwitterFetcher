//
//  Currency.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation

class Currency {
    var currency: String
    var code: String
    var mid: Float

    
    init(currency: String, code: String, mid: Float ) {
        self.currency = currency
        self.code = code
        self.mid = mid

    }
}



