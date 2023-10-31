//
//  WeatherTableViewCell.swift
//  ViperArchitectureWeatherExample
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/23.
//

import UIKit

final class WeatherTableViewCell: UITableViewCell {
    static let identifier = String(describing: WeatherTableViewCell.self)
    
    lazy private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold, width: .condensed)
        label.textColor = .systemPink
        return label
    }()
    
    lazy private var conditionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium, width: .condensed)
        label.textColor = .black
        return label
    }()
    
    lazy private var views: [UIView] = [
        temperatureLabel,
        conditionLabel
    ]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.temperatureLabel.text = nil
        self.conditionLabel.text = nil
    }
    
    private func setupViews() {
        views.forEach { view in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            temperatureLabel.bottomAnchor.constraint(equalTo: conditionLabel.topAnchor),
            
            conditionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 5),
            conditionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            conditionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            conditionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 10),
//            conditionLabel.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    func configure(weather: WeatherViewModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperature.description
            self.conditionLabel.text = weather.condition
        }
    }
    
}
