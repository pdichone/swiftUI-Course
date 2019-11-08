

import Foundation


class Services {
    
    let apiID = "ed60fcfbd110ee65c7150605ea8aceea"
    
    func getWeatherData(city: String, completion: @escaping (ForecastWeatherResponse?)->()) { // must change to this type in order to get it all!
        
        
        //my weather api from openWeatherMap.org
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&APPID=\(apiID)&units=imperial") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
                        
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            //print(data)
            let weatherResponse = try? JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
           // print("data: \(weatherResponse!)")
        
            if let weatherResponse = weatherResponse {
               // let weather = weatherResponse.list
               
                completion(weatherResponse) //just give me the entire payload response
               // completion(weather![0]) //to get just the list
            }else {
                completion(nil)
            }
            
            
        }.resume()
        
    }
}

