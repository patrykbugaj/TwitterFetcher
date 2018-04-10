//
//  TwitterFetcherTests.swift
//  TwitterFetcherTests
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import XCTest
@testable import TwitterFetcher

class CurrencyDataServiceMock: NSObject, CurrencyDataService{
    fileprivate let currencies: [Currency]
    init(currencies: [Currency]) {
        self.currencies = currencies
    }
    
    func fetchCurrency(_ callBack: @escaping ([Currency]) -> Void) {
        callBack(currencies)
    }
   
}

class CurrencyViewMock: NSObject, CurrencyView {
    var setCurrenciesCalled = false
    var setEmptyCurrenciesCalled = false
    
    func setCurrencies(_ currencies: [CurrencyViewData]) {
        setCurrenciesCalled = true
    }
    
    func setEmptyCurrencies() {
        setEmptyCurrenciesCalled = true
    }
    
    func startLoading() {
    }
    
    func finishLoading() {
    }
}


class TwitterFetcherTests: XCTestCase {
    
    let emptyCurrencyDataServiceMock = CurrencyDataServiceMock(currencies:[Currency]())
    let filledCurrencyDataServiceMock = CurrencyDataServiceMock(currencies:[Currency(currency: "USA", code: "USD", mid: 3.4311)])
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetEmptyIfNoCurrenciesAvailable() {
        let currencyViewMock = CurrencyViewMock()
        let currencyPresenterInTest = CurrencyPresenter(currencyDataService: emptyCurrencyDataServiceMock)
    
        currencyPresenterInTest.attachView(currencyViewMock)
    
        currencyPresenterInTest.getCurrencys()
        XCTAssertTrue(currencyViewMock.setEmptyCurrenciesCalled)
        
    }

    func testSetCurrencies() {
        let currencyViewMock = CurrencyViewMock()
        let currencyPresenterInTest =  CurrencyPresenter(currencyDataService: filledCurrencyDataServiceMock)
 
        currencyPresenterInTest.attachView(currencyViewMock)

        currencyPresenterInTest.getCurrencys()

        XCTAssertTrue(currencyViewMock.setCurrenciesCalled)

    }
    
}
