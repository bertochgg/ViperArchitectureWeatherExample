//
//  WeatherProtocols.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import UIKit

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterWeatherProtocol: AnyObject {
    var view: PresenterToViewWeatherProtocol? { get set }
    
    func fetchWeather(for city: String)
}

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewWeatherProtocol: AnyObject {
    func displayWeather(weather: WeatherViewModel)
    func displayError(error: Error)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorWeatherProtocol: AnyObject {
    var presenter: InteractorToPresenterWeatherProtocol? { get set }
    
    func fetchWeather(for city: String)
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterWeatherProtocol: AnyObject {
    func weatherFetched(_ weather: WeatherEntity)
    func weatherFetchFailed(_ error: Error)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterWeatherProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    static func createModule() -> UIViewController
}
