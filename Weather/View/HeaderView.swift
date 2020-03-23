//
//  HeaderView.swift
//  Weather
//
//  Created by  Алексей Черебаев on 1/29/20.
//  Copyright © 2020  Алексей Черебаев. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    let data: CurrentWeatherViewModel
    var body: some View {
        VStack {
            Text("АЛМАТЫ").font(.title).fontWeight(.light)
            Text(data.time)
                .foregroundColor(Color.gray)
        }
    }
}
