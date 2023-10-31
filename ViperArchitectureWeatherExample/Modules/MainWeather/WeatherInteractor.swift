//
//  WeatherInteractor.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import Foundation

final class WeatherInteractor: PresenterToInteractorWeatherProtocol {
    private let weatherNetworkService: WeatherServiceProtocol
    weak var presenter: InteractorToPresenterWeatherProtocol?
    
    init(weatherNetworkService: WeatherServiceProtocol) {
        self.weatherNetworkService = weatherNetworkService
    }
    
    func fetchWeather(for city: String) {
        self.weatherNetworkService.fetchWeather(for: city) { result in
            switch result {
            case .success(let weather):
                let viewModel = WeatherViewModel(temperature: weather.temperature, condition: weather.condition)
                self.presenter?.weatherFetched(weather)
            case .failure(let error):
                self.presenter?.weatherFetchFailed(error)
            }
        }
    }
    
    
}
