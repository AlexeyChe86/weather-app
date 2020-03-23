//
//  Coordinate.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/28/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude), \(longitude)"
    }
    
    static var almatyCity: Coordinate {
        return Coordinate(latitude: 43.2173601, longitude: 76.6639822)
    }
}
