//
//  Injectable.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 04.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation
import Swinject


protocol Injectable {
    init(container: Container)
}
