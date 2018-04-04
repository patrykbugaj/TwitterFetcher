//
//  CurrencyData.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Swinject
import ObjectMapper
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class CurrencyData: NSObject, Injectable {
    required init(container: Container) {
        super.init()
    }
    
    
//    func fetchCurrency() {
//        let URL = "https://api.nbp.pl/api/exchangerates/tables/a?format=JSON"
//
//        Alamofire.request(URL).responseObject { (response: DataResponse<Data>) in
//            let currencyResponse = response.result.value
//
//            if let error = response.result.error {
//                let errorString = error.localizedDescription
//                print(errorString)
//            }
//
//            if let rates = currencyResponse?.rates {
//                for currenncy in rates {
//                    print(currenncy.currency)
//                }
//            }
//        }
//    }
    
    func fetchCurrency() {
      
        let URL = "https://api.nbp.pl/api/exchangerates/tables/a?format=JSON"
        Alamofire.request(URL, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let currency = json.array
                for item in currency! {
                    for rates in item["rates"].arrayValue {
                        print(rates["currency"])
                        print(rates["code"])
                        print(rates["mid"])
                    }
                }
            case .failure(let error):
                print(error)
            default:
                print("default")
            }
        }
        }
    
}
