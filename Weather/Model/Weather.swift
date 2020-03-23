//
//  Weather.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/28/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let currently: CurrentWweather
    let daily: DailyWeather
    
    init() {
        self.currently = CurrentWweather()
        self.daily = DailyWeather()
    }
}
