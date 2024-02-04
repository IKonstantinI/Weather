//
//  Weather.swift
//  Weather
//
//  Created by horze on 30.01.2024.
//


struct WeatherResponse: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let rain: Rain?
}

struct Weather: Decodable {
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let humidity: Double
}

struct Wind: Decodable {
    let speed: Double
}

struct Clouds: Decodable {
    let all: Int
}

struct Rain: Decodable {
    let oneHour: Double

    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}


