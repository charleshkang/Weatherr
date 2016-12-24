//
//  Weather.swift
//  C4QWeather
//
//  Created by Charles Kang on 11/21/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation

struct Weather {
    
    let maxTempF: Int
    let minTempF: Int
    let maxTempC: Int
    let minTempC: Int
    let dateTime: String
    
    // MARK: Lifecycle
    init(maxTempF: Int,
         minTempF: Int,
         maxTempC: Int,
         minTempC: Int,
         dateTime: String) {
        self.maxTempF = maxTempF
        self.minTempF = minTempF
        self.maxTempC = maxTempC
        self.minTempC = minTempC
        self.dateTime = dateTime
    }
}
