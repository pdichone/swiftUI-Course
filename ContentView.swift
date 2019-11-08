//
//  ContentView.swift
//  Weather-Forecast-Final-XC11
//
//  Created by Paulo Dichone on 10/18/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showView: Bool = false
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    init() {
        self.forecastViewModel = ForecastViewModel()
    }
    
    var body: some View {
        ZStack {
            BackSplash()
            VStack {
                TopView(showField: self.showView, forecastViewModel: self.forecastViewModel)
                
                MidView(forecastViewModel: self.forecastViewModel)
            }
            
            VStack(alignment: .center, spacing: 8) {
                //add image/icon later
                Image(systemName: Helper().showWeatherIcon(item: self.forecastViewModel.weatherForecast))
                    .resizable()
                    .frame(width: 200, height:  200, alignment: .center)
                    .foregroundColor(.white)
                
                CurrentTempView(forecastViewModel: self.forecastViewModel)
                
                Text("7-Day Weather Forecast")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.all, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(forecastViewModel.getForecastList(), id: \.dt) { forecast in
                            BottomScrollForecast(forecastData: forecast)
                            
                        }
                    }
                }
            }
            
            
            
            
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
