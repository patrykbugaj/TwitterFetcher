//
//  CurrencyPresenter.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 05.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation

struct CurrencyViewData {
    let code: String
    let country: String
    let mid: Float
}

class CurrencyPresenter {
    
    fileprivate var currencyDataService : CurrencyDataService
    fileprivate var dateService : TodayDateService
    weak fileprivate var currencyView : CurrencyView?
    
    init(currencyDataService: CurrencyDataService, dateService: TodayDateService) {
        self.currencyDataService = currencyDataService
        self.dateService = dateService
    }
    
    func attachView(_ view: CurrencyView) {
        currencyView = view
    }
    
    func detachView() {
        currencyView = nil
    }
    
    func getCurrencys() {
        self.currencyView?.startLoading()
        currencyDataService.fetchCurrency{ [weak self] currencies in
            self?.currencyView?.finishLoading()
            if currencies.count == 0 {
                self?.currencyView?.setEmptyCurrencies()
            } else {
                let mappedCurrencies = currencies.map {
                    return CurrencyViewData(code: "\($0.code)", country: "\($0.currency)", mid: $0.mid)
                }
                self?.currencyView?.setCurrencies(mappedCurrencies)
            }
        }
    }
    
    func getDate() {
        self.currencyView?.setDate(dateService.getCurrentDate())
        
    }

}
