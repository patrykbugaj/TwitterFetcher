//
//  ViewController.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import UIKit
import Swinject

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyTable: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let CurrencyPresenterService = Injector.get(injectable: CurrencyPresenter.self)
    private var currenciesToDisplay = [CurrencyViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTable.dataSource = self
        activityIndicator?.hidesWhenStopped = true
        
        CurrencyPresenterService.attachView(self)
        CurrencyPresenterService.getCurrencys()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenciesToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "currencyCell")
        let currencyViewData = currenciesToDisplay[indexPath.row]
        cell.textLabel?.text = currencyViewData.code + " " + currencyViewData.country
        cell.detailTextLabel?.text = "\(currencyViewData.mid)" + " " + "PLN"
        return cell
    }
    
}

extension ViewController: CurrencyView {
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func setCurrencies(_ currencies: [CurrencyViewData]) {
        currenciesToDisplay = currencies
        currencyTable?.isHidden = false
        emptyView?.isHidden = true
        currencyTable.reloadData()
    }
    
    func setEmptyCurrencies() {
        currencyTable?.isHidden = true
        emptyView?.isHidden = false
    }
    
    
}
