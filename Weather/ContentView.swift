//
//  ContentView.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/28/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView(data: networkManager.currentWeather)
                
                Spacer()
                
                CurrentWeatherView(data: networkManager.currentWeather)
                    .padding([.leading, .trailing])
                
                Spacer()
                
                DailyWeatherView(data: networkManager.dailyWeather)
                
            }
        }.colorScheme(.dark)
    }
}
