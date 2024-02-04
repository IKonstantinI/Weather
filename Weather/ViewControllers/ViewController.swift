//
//  ViewController.swift
//  Weather
//
//  Created by horze on 29.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var currentDataLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var rainLabel: UILabel!
    @IBOutlet var windspeedLabel: UILabel!
    @IBOutlet var cloudsLabel: UILabel!
    
    private let weatherService = WeatherService()
    private let urlString = "https://api.openweathermap.org/data/2.5/weather?q=London&appid=88701baecb8fed00ef62b9be45ce4c7b&units=metric"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService.fetch(urlString: urlString) { (weatherData: WeatherResponse?) in
            DispatchQueue.main.sync { [self] in
                if let weatherData = weatherData {
                    self.cityLabel.text = weatherData.name
                    self.tempLabel.text = "\(weatherData.main.temp)°C"
                    self.feelsLikeLabel.text = "Feels like: \(weatherData.main.feels_like)°C"
                    self.humidityLabel.text = "Humidity: \(weatherData.main.humidity)%"
                    self.windspeedLabel.text = "Wind speed: \(weatherData.wind.speed)m/s"
                    self.cloudsLabel.text = "Clouds: \(weatherData.clouds.all)%"
                    
                    let date = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMM d, h:mm a"
                    self.currentDataLabel.text = dateFormatter.string(from: date)
                    
                    if let rain = weatherData.rain {
                        self.rainLabel.text = "Rain: \(rain.oneHour)mm"
                    } else {
                        self.rainLabel.text = "No rain"
                    }
                    
                    let iconCode = weatherData.weather[0].icon
                    let iconUrlString = "https://openweathermap.org/img/wn/\(iconCode)@2x.png"
                    if let url = URL(string: iconUrlString){
                        self.weatherService.loadImage(from: url) { (image) in
                            DispatchQueue.main.async {
                                self.weatherImage.image = image
                            }
                        }
                    } else {
                        print("Failed to get weather data")
                    }
                }
            }
        }
    }
}



