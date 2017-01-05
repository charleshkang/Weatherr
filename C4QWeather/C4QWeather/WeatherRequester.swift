//
//  WeatherRequester.swift
//  C4QWeather
//
//  Created by Charles Kang on 11/21/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

public func main(_ function: @escaping () -> Void) {
    DispatchQueue.main.async(execute: function)
}

public func background(_ function: @escaping () -> Void) {
    DispatchQueue.global(qos: .default).async(execute: function)
}

public class WeatherRequester {
    
    //MARK: Private Properties
    private let dataParser = WeatherParser()
    
    //MARK: Action Methods
    func getWeather(for completion: ((Result<[Weather]>) -> Void)?) {
        background {
                Alamofire.request(Constant.urlWithIDAndSecret).responseJSON { (response) in
                guard let statusCode = response.response?.statusCode  else {
                    main { completion?(.failure(.unexpectedError)) }
                    return
                }
                guard statusCode == SuccessStatusCode.ok.rawValue else {
                    print(statusCode)
                    main { completion?(.failure(RequestError(code: statusCode))) }
                    return
                }
                guard let jsonData = response.data else {
                    main { completion?(.failure(.unexpectedError)) }
                        return
                    }
                let json = JSON(data: jsonData)
                let weatherObjects = self.dataParser.parseWeatherJSON(json)
                main { completion?(.success(weatherObjects))
                }
            }
        }
    }
    
}
