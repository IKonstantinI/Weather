//
//  WeatherService.swift
//  Weather
//
//  Created by horze on 30.01.2024.
//

import Foundation

final class WeatherService {
    let apiKey = "88701baecb8fed00ef62b9be45ce4c7b"
    
    func fetchWeather(cityName: String, completion: @escaping (WeatherResponse?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let  self else { return }
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(nil)
                return
            }
            
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(weatherResponse)
            } catch {
                print("Error decoding: \(error)")
                completion(nil)
            }
        }.resume()
    }
}


