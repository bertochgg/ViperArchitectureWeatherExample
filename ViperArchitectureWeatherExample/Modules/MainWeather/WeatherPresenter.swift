//
//  WeatherPresenter.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import Foundation

class WeatherPresenter: ViewToPresenterWeatherProtocol {
    weak var view: PresenterToViewWeatherProtocol?
    private let interactor: PresenterToInteractorWeatherProtocol
    private let router: PresenterToRouterWeatherProtocol
    
    private let mapper: WeatherViewModelMapperProtocol
    
    
    init(interactor: PresenterToInteractorWeatherProtocol,
         mapper: WeatherViewModelMapperProtocol,
         router: PresenterToRouterWeatherProtocol) {
        self.interactor = interactor
        self.mapper = mapper
        self.router = router
    }
    
    func fetchWeather(for city: String) {
        self.interactor.fetchWeather(for: city)
    }
    
}

extension WeatherPresenter: InteractorToPresenterWeatherProtocol {
    func weatherFetched(_ weather: WeatherEntity) {
        let weatherViewModel = mapper.map(entity: weather)
        self.view?.displayWeather(weather: weatherViewModel)
    }
    
    func weatherFetchFailed(_ error: Error) {
        self.view?.displayError(error: error)
    }
}
