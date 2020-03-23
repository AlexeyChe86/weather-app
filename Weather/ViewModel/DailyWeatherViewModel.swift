//
//  DailyWeatherViewModel.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/29/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import Foundation

struct DailyWeatherViewModel {
    var data: [Data]
    
    struct Data {
        var day: String
        var temperatureHigh: String
        var temperatureLow: String
        var icon: String
    }
    
    init() {
        self.data = [Data]()
    }
    
    init(model: DailyWeather) {
        self.init()
        
        for index in 1...5 {
            let date = Date(timeIntervalSince1970: model.data[index].time)
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            let formattedDay = formatter.string(from: date)
            
            let roundedHighTemperature = Int(model.data[index].temperatureHigh)
            let formattedTemperatureHigh = "\(roundedHighTemperature)"
            
            let roundedLowTemperature = Int(model.data[index].temperatureLow)
            let formattedTemperatureLow = "\(roundedLowTemperature)"
            
            let formattedIcon = model.data[index].icon
            
            self.data.append(Data(day: formattedDay, temperatureHigh: formattedTemperatureHigh, temperatureLow: formattedTemperatureLow, icon: formattedIcon))
        }
    }
}
