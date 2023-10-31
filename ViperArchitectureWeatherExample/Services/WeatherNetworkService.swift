//
//  WeatherNetworkService.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import Foundation

protocol WeatherServiceProtocol: AnyObject {
    typealias WeatherResult = Result<WeatherEntity, Error>
    func fetchWeather(for city: String, completion: @escaping (WeatherResult) -> Void)
}

final class WeatherAPIService: WeatherServiceProtocol {
    func fetchWeather(for city: String, completion: @escaping (WeatherResult) -> Void) {
        // Simulate a network request and parse the response (replace with actual API call)
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            let weather = WeatherEntity(temperature: 25.0, condition: "Sunny")
            completion(.success(weather))
        }
    }
}
