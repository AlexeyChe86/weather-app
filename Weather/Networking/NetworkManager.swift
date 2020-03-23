//
//  NetworkManager.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/29/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import SwiftUI
import Combine

class NetworkManager: ObservableObject {
    
    @Published var currentWeather = CurrentWeatherViewModel()
    @Published var dailyWeather = DailyWeatherViewModel()
    
    
    let client = DarkSkyAPIClient()
    
    init() {
        client.getWeather() { weather, error in
            if let weather = weather {
                self.currentWeather = CurrentWeatherViewModel(model: weather.currently)
                self.dailyWeather = DailyWeatherViewModel(model: weather.daily)
            }
        }
    }
}
