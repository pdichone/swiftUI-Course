//
//  MidView.swift
//  Weather-Forecast-Final-XC11
//
//  Created by Paulo Dichone on 10/18/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import SwiftUI

struct MidView: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("\(self.forecastViewModel.currentCity), \(self.forecastViewModel.currentCountry)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                
                Text(self.forecastViewModel.weatherDay)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                .bold()
            }
            Spacer()
        }.padding(.trailing, 200)
            
    }
}

//struct MidView_Previews: PreviewProvider {
//    static var previews: some View {
//        MidView()
//    }
//}
