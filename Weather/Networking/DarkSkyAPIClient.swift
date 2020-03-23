//
//  DarkSkyAPIClient.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/29/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias WeatherCompletionHandler = (Weather?, Error?) -> Void
    typealias CurrentWeatherCompletionHandler = (CurrentWweather?, Error?) -> Void
    typealias DailyWeatherCompletionHandler = (DailyWeather?, Error?) -> Void
    
    func getWeather(completionHandler completion: @escaping WeatherCompletionHandler) {
        
        guard let url = URL(string: "https://api.darksky.net/forecast/c1c3142cb53450fefdfd518859c8ff0e/43.2173601,76.6639822?units=si&lang=ru") else {
            completion(nil, DarkSkyError.invalidURL)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, DarkSkyError.requestFailed)
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        do {
                            let weather = try self.decoder.decode(Weather.self, from: data)
                            completion(weather, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, DarkSkyError.invalidData)
                    }
                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
    
    func getCurrentWeather(completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getWeather() { weather, error in
            completion(weather?.currently, error)
        }
    }
    
    func getDailyWeather(completionHandler completion: @escaping DailyWeatherCompletionHandler) {
        getWeather() { weather, error in
            completion(weather?.daily, error)
        }
    }
    
}
