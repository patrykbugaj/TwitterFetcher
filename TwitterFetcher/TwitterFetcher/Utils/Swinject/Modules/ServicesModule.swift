//
//  ServiceModules.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation
import Swinject

class ServicesModule: Module {
    func bind(container: Container){
        container.register(CurrencyData.self) { _ in CurrencyData(container: container) }
        .inObjectScope(.container)
        container.register(CurrencyPresenter.self) { _ in CurrencyPresenter(container: container) }
            .inObjectScope(.container)
    }
}
