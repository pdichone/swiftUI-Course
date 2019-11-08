//
//  BackSplash.swift
//  Weather-Forecast-Final-XC11
//
//  Created by Paulo Dichone on 10/18/19.
//  Copyright © 2019 Paulo Dichone. All rights reserved.
//

import SwiftUI

struct BackSplash: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct BackSplash_Previews: PreviewProvider {
    static var previews: some View {
        BackSplash()
    }
}
