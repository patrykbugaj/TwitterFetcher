//
//  Protocols.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 06.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation

protocol CurrencyView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setCurrencies(_ currencies: [CurrencyViewData])
    func setDate(_ date: String)
    func setEmptyCurrencies()
}

protocol CurrencyDataService: NSObjectProtocol {
    func fetchCurrency(_ callBack:@escaping ([Currency]) -> Void)
}

protocol TodayDateService: NSObjectProtocol {
    func getCurrentDate() -> String
}
