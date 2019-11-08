//
//  ForecastViewModel.swift
//  Weather-Forecast-Final-XC11
//
//  Created by Paulo Dichone on 10/18/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import Combine
import SwiftUI

class ForecastViewModel: ObservableObject {
    var weatherService: Services!
    var cityName: String = "Spokane"
    
    @Published var weatherForecast = ForecastWeatherResponse()
    
    init() {
        self.weatherService = Services()
    }
    
    func getForecastList() -> [MainForecastParams] {
        if let mList = self.weatherForecast.list {
          // print("List \(mList)")
            return mList
        }else {
            return []
        }
    }
    
    var currentCity: String  {
        if let city = self.weatherForecast.city?.name {
            return city
        }else {
            return ""
        }
    }
    
    var currentCountry: String {
        if let country = self.weatherForecast.city?.country {
            return country
        }else {
             return ""
        }
    }
    
    var weatherDescription: String {
        if let description = self.weatherForecast.list?.first?.weather?.first?.description {
            let formattedDesc = description.capitalized(with: .current)
            
            return formattedDesc
        }else {
            return ""
        }
    }
    var temperature: String {
        if let temp = self.weatherForecast.list?.first?.temp?.day {
            let formattedString = String(format: "%.0f", temp)
            return formattedString + "°"
        }else {
             return ""
        }
    }
    
    var weatherDay: String {
        if let day = self.weatherForecast.list?.first?.dt {
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        }else {
             return ""
        }
    }
    
    
    var windSpeed: String {
        if let wind = self.weatherForecast.list?.first?.speed {
            let formattedWindSpeed = String(format: "%.1f",(wind))
            return formattedWindSpeed + "mi/h"
        }else {
            return ""
        }
    }
    
    var humidity: String {
        if let hum = self.weatherForecast.list?.first?.humidity {
            let formattedHum = String(hum)
            return formattedHum + "%"
        }else {
            return ""
        }
    }
    
    var maxTemp: String {
        if let max = self.weatherForecast.list?.first?.temp?.max {
            let formattedMaxTemp = String(format: "%.0f",(max))
            return formattedMaxTemp + "°"
        }else {
            return ""
        }
    }
    
    
    func searchCity() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeatherForecast(by: city)
        }
    }
    
    func fetchWeatherForecast(by city: String) {
        self.weatherService.getWeatherData(city: cityName) {
             forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.weatherForecast = forecast
                    
//                    print("Forecast: \(forecast)")
                }
            }
        }
    }
    
}


