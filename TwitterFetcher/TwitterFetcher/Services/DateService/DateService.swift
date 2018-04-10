//
//  DateService.swift
//  TwitterFetcher
//
//  Created by Patryk Bugaj on 09.04.2018.
//  Copyright © 2018 Patryk Bugaj. All rights reserved.
//

import Foundation

class DateService:NSObject, TodayDateService {
    
    func getCurrentDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month,.day], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        
        let properDateString = String(day!) + "/" + String(month!) + "/" + String(year!)
        
        return properDateString
    }
    
}
