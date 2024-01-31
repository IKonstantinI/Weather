//
//  ViewController.swift
//  Weather
//
//  Created by horze on 29.01.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var showWeather: UIButton!
    let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        weatherService.fetchWeather(cityName: "London") { weatherData in
            DispatchQueue.main.async {
                if let weatherData = weatherData {
                    print("Weather in \(weatherData.name): \(weatherData.main.temp)°C")
                } else {
                    print("Failed to get weather data")
                }
            }
        }
    }
}

