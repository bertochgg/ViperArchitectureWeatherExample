//
//  WeatherRouter.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import UIKit

final class WeatherRouter: PresenterToRouterWeatherProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Init References
        let interactor: PresenterToInteractorWeatherProtocol = WeatherInteractor(weatherNetworkService: WeatherAPIService())
        let router: PresenterToRouterWeatherProtocol = WeatherRouter()
        let presenter: ViewToPresenterWeatherProtocol & InteractorToPresenterWeatherProtocol = WeatherPresenter(interactor: interactor,
                                                                                                                mapper: WeatherViewModelMapper(),
                                                                                                                router: router)
        let view = WeatherViewController(presenter: presenter, dataSource: WeatherDataSource())
        
        presenter.view = view
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
