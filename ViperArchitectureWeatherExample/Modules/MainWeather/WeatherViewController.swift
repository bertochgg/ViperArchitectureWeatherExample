//
//  WeatherViewController.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import UIKit

final class WeatherViewController: UIViewController {
    private let presenter: ViewToPresenterWeatherProtocol
    private let dataSource: WeatherDataSourceProtocol
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WeatherTableViewCell.self,
                           forCellReuseIdentifier: WeatherTableViewCell.identifier)
        return tableView
    }()
    
    init(presenter: ViewToPresenterWeatherProtocol, dataSource: WeatherDataSourceProtocol) {
        self.presenter = presenter
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.fetchWeather(for: "New York")
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = dataSource
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension WeatherViewController: PresenterToViewWeatherProtocol {
    func displayWeather(weather: WeatherViewModel) {
        print(weather)
        DispatchQueue.main.async {
            self.dataSource.updateData(viewModel: weather)
            self.tableView.reloadData()
        }
    }
    
    func displayError(error: Error) {
        print(error)
    }
    
}
