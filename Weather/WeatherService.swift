//
//  WeatherService.swift
//  Weather
//
//  Created by horze on 30.01.2024.
//

import Foundation
import UIKit

final class WeatherService {
    func fetch<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(nil)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(response)
            } catch {
                print("Error decoding: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
}


