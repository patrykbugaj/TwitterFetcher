//
//  CurrencyPresenter.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 05.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation
import Swinject

struct CurrencyViewData {
    let code: String
    let country: String
    let mid: Float
}

protocol CurrencyView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setCurrencies(_ currencies: [CurrencyViewData])
    func setEmptyCurrencies()
}

class CurrencyPresenter: NSObject, Injectable {
    private let CurrencyDataService = Injector.get(injectable: CurrencyData.self)
   
    required init(container: Container) {
        super.init()
    }
    
    weak fileprivate var currencyView : CurrencyView?
    
    func attachView(_ view: CurrencyView) {
        currencyView = view
    }
    
    func detachView() {
        currencyView = nil
    }
    
    func getCurrencys() {
        self.currencyView?.startLoading()
        CurrencyDataService.fetchCurrency{ [weak self] currencies in
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

}
