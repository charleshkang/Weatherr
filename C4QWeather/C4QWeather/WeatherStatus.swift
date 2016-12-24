//
//  WeatherStatus.swift
//  C4QWeather
//
//  Created by Charles Kang on 11/21/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(RequestError)
    
}

enum SuccessStatusCode: Int {
    case ok = 200
    case created = 201
    
}

enum RequestError: Error {
    case invalidQuery
    case noContent
    case notFound
    case methodNotAllowed
    case unexpectedError
    
    init(code: Int) {
        switch code {
        case 204: self = .noContent
        case 404: self = .notFound
        case 405: self = .methodNotAllowed
        default: self = .unexpectedError
        }
    }
    
}
