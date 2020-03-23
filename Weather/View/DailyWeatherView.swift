//
//  DailyWeatherView.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/29/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import SwiftUI

struct DailyWeatherView: View {
    let data: DailyWeatherViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("5-дневный прогноз")
                    .foregroundColor(Color.gray)

                Spacer()
            }.padding(.leading)

            Divider()
                .padding([.leading, .trailing])
        
            ForEach(data.data, id: \.day) { data in
            ZStack {
                HStack {
                    Text(data.day)
                    Spacer()
                    Text(data.temperatureHigh).padding(8)
                    Text(data.temperatureLow)
                        .foregroundColor(Color.gray)
                    }.padding([.leading, .trailing])

                Image(data.icon)
                    .resizable()
                    .aspectRatio(UIImage(named: data.icon)!.size, contentMode: .fit)
                    .frame(width: 50, height: 25)
                }
            }
        }
    }
}
