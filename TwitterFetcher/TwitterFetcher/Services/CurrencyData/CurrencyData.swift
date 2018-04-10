//
//  CurrencyData.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class CurrencyData: NSObject, CurrencyDataService {

    func fetchCurrency(_ callBack:@escaping ([Currency]) -> Void) {

        let URL = "https://api.nbp.pl/api/exchangerates/tables/a?format=JSON"
        var currenciesArray = [Currency]()
        Alamofire.request(URL, method: .get).validate().responseJSON { (response) -> Void in
            if let value = response.result.value {
                let json = JSON(value)
                let currency = json.array
                for item in currency! {
                    for rates in item["rates"].arrayValue {
                        currenciesArray.append(Currency(currency: rates["currency"].stringValue, code: rates["code"].stringValue, mid: rates["mid"].floatValue))
                    }
                }
            }
        }
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            callBack(currenciesArray)
        }
    }
    
}
