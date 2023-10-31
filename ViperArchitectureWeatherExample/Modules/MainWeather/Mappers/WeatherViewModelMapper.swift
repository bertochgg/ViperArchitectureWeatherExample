//
//  WeatherViewModelMapper.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import Foundation

protocol WeatherViewModelMapperProtocol: AnyObject {
    func map(entity: WeatherEntity) -> WeatherViewModel
}

final class WeatherViewModelMapper: WeatherViewModelMapperProtocol {
    func map(entity: WeatherEntity) -> WeatherViewModel {
        .init(temperature: entity.temperature,
              condition: entity.condition)
    }
}
