//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/29/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import SwiftUI

struct CurrentWeatherView: View {
    let data: CurrentWeatherViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(data.icon)
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Text(data.summary)
                    .font(.title)
                    .fontWeight(.light)
                }.padding(0)
            
            HStack {
                Text(data.temperature)
                    .font(.system(size: 60))
                    .fontWeight(.ultraLight)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("ОЩУЩАЕТСЯ")
                        Spacer()
                        Text(data.apparentTemperature)
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("СКОРОСТЬ ВЕТРА")
                        Spacer()
                        Text(data.wendSpeed)
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("ВЛАЖНОСТЬ")
                        Spacer()
                        Text(data.humidity)
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("АТМОСФЕРНЫЕ ОСАДКИ")
                        Spacer()
                        Text(data.precipProbability)
                        }.padding(.bottom, 1)
                    }.font(.caption)
                }.padding(0)
        }
    }
}
