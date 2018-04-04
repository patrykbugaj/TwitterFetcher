//
//  Injector.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation
import Swinject

class Injector {
    private static let sharedInstance = Injector()
    
    private let container = Container()
    
    init() {
//        UtilsModule().bind(container: container)
        ServicesModule().bind(container: container)
    }
    
    static func get<Injectable>(injectable: Injectable.Type) -> Injectable {
        return Injector.sharedInstance.container.resolve(injectable)!
    }
}
