//
//  ViewController.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, CurrencyView, UITableViewDelegate {
    
    @IBOutlet weak var currencyTable: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let currencyPresenter = CurrencyPresenter(currencyDataService: CurrencyData(), dateService: DateService())
    private var dateToShow = String()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator?.hidesWhenStopped = true
        currencyPresenter.attachView(self)
        currencyPresenter.getCurrencys()
        currencyPresenter.getDate()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func setCurrencies(_ currencies: [CurrencyViewData]) {
         let currenciesToDisplay : Observable<[CurrencyViewData]> = Observable.just(currencies)
        currenciesToDisplay.bind(to: currencyTable.rx.items(cellIdentifier: "currencyCell")) {
            _, currency, cell in
            if let cellToUse = cell as? CurrencyCell {
                cellToUse.countryLabel.text = currency.code + " " + currency.country
                cellToUse.currencyLabel.text = "\(currency.mid)" + " " + "PLN"
            }
            titleForHeaderInSection
        }.disposed(by: self.disposeBag)
        
        currencyTable?.isHidden = false
        emptyView?.isHidden = true
        currencyTable.reloadData()
        print("setCurrencies")
    }
    
    func setEmptyCurrencies() {
        currencyTable?.isHidden = true
        emptyView?.isHidden = false
        
    }
    
    func setDate(_ date: String) {
        dateToShow = date
       print("heheehehe")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
                headerView.backgroundColor = UIColor.clear
                let label = UILabel(frame: CGRect(x:30, y:15, width: headerView.bounds.size.width, height: 30))
        
                label.text = dateToShow
                label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
                headerView.addSubview(label)
        
                return headerView
    }
    
         func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 60
        }
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
}

//extension ViewController: UITableViewDelegate {
//
//     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 60
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//        headerView.backgroundColor = UIColor.clear
//        let label = UILabel(frame: CGRect(x:30, y:15, width: headerView.bounds.size.width, height: 30))
//
//        label.text = dateToShow
//        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//
//        headerView.addSubview(label)
//
//        return headerView
//    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return currenciesToDisplay.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "currencyCell")
//        let currencyViewData = currenciesToDisplay[indexPath.row]
//        cell.textLabel?.text = currencyViewData.code + " " + currencyViewData.country
//        cell.detailTextLabel?.text = "\(currencyViewData.mid)" + " " + "PLN"
//        return cell
//    }
    
//}

