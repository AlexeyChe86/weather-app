//
//  DailyWeather.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/28/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import Foundation

struct DailyWeather: Codable {
    let data: [Data]
    
    struct Data: Codable {
        let time: Double
        let temperatureHigh: Double
        let temperatureLow: Double
        let icon: String
    }
    
    init() {
        self.data = [Data]()
    }
}
