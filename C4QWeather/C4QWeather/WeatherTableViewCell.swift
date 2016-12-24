//
//  WeatherTableViewCell.swift
//  C4QWeather
//
//  Created by Charles Kang on 11/21/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    // MARK: Actions
    func configureFahrenheit(With weather: Weather) {
        highTempLabel.text = String("High: \(weather.maxTempF)℉")
        lowTempLabel.text = String("Low: \(weather.minTempF)℉")
        dateTimeLabel.text = weather.dateTime
    }
    func configureCelsius(With weather: Weather) {
        highTempLabel.text = String("High: \(weather.maxTempC)℃")
        lowTempLabel.text = String("Low: \(weather.minTempC)℃")
        dateTimeLabel.text = weather.dateTime
    }
}
