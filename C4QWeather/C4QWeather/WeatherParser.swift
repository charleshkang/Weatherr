//
//  WeatherParser
//  C4QWeather
//
//  Created by Charles Kang on 11/21/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import SwiftyJSON

class WeatherParser {
    
    //MARK: Action Methods
    
    /**
     use flatMap instead of map here because data from a backend can always fail,
     use flatMap so we only return successful weather objects
     */
    func parseWeatherJSON(_ json: JSON) -> [Weather] {
        let weatherArray = json["response"][0]["periods"].arrayValue
        return weatherArray.flatMap { Weather(json: $0) }
    }
}

extension Weather {
    
    /**
     create a failable initializer to make sure
     we only get properties that are valid. also use
     guard to take advantage of its early exit feature
     */
    init?(json: JSON) {
        guard let maxTempF = json["maxTempF"].int,
            let minTempF = json["minTempF"].int,
            let maxTempC = json["maxTempC"].int,
            let minTempC = json["minTempC"].int,
            let dateTimeISO = json["dateTimeISO"].string
            else { return nil }
        self.maxTempF = maxTempF
        self.minTempF = minTempF
        self.maxTempC = maxTempC
        self.minTempC = minTempC
        self.dateTime = dateTimeISO
    }
}
