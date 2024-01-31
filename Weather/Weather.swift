//
//  Weather.swift
//  Weather
//
//  Created by horze on 30.01.2024.
//

struct WeatherResponse: Decodable {
    let name: String
    let main: Main

    struct Main: Decodable {
        let temp: Double
    }
}

