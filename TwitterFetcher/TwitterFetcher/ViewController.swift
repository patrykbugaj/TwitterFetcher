//
//  ViewController.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let CurrencyDataService = Injector.get(injectable: CurrencyData.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.CurrencyDataService.fetchCurrency()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

