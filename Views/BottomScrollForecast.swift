//
//  BottomScrollForecast.swift
//  Weather-Forecast-Test-XC11
//
//  Created by Paulo Dichone on 10/7/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import SwiftUI

struct BottomScrollForecast: View {
   
    let forecastData: MainForecastParams
    @State var icon = "sun.max"
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                Text(String(Helper().timeConverter(timeStamp: forecastData.dt!, isDay: true)))
                    .foregroundColor(Color("icons"))

                
            }.offset(y: -75)
            
            HStack {
                Image(systemName: Helper().showWeatherIcon(item: forecastData))
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color("secondary"))
                    .background(RoundedRectangle(cornerRadius: 60)
                        .frame(width: 90, height: 80)
                        .foregroundColor(Color("gradient2")))
                    .padding(.all, 20)
                    .offset(x: -20)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(String(format: "%.0f", (forecastData.temp?.min)!) + "º")
                            .foregroundColor(.gray)
                        
                        Image(systemName: "arrow.down")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text(String(format: "%.0f", (forecastData.temp?.max!)!) + "º")
                            .foregroundColor(.gray)
                        
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                    
                    Text("Hum: \(String(forecastData.humidity!))" +
                    "%")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Text("Win: \(String(format: "%.1f",forecastData.speed!)) mi/h")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                
            }
            
            
            
        }.frame(width: 220, height: 200)
            .background(Color.white)
            .cornerRadius(30)
            .padding(.leading, 15)
    }
}



