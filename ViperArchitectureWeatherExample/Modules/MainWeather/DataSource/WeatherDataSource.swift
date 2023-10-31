//
//  WeatherDataSource.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import UIKit

protocol WeatherDataSourceProtocol: AnyObject, UITableViewDataSource {
    func updateData(viewModel: WeatherViewModel)
}

final class WeatherDataSource: NSObject, WeatherDataSourceProtocol {
    private var weatherViewModels: [WeatherViewModel] = []
    
    func updateData(viewModel: WeatherViewModel) {
        self.weatherViewModels.append(viewModel)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(weather: weatherViewModels[indexPath.row])
        
        return cell
    }
    
    
}
