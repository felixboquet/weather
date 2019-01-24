//
//  HistoryTableViewCell.swift
//  weatherapp
//
//  Created by Felix Boquet on 24/01/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AlamofireImage

class HistoryTableViewCell: UITableViewCell {
    
    var temperatureLabel: UILabel!
    var weatherImage: UIImageView!
    var cityLabel: UILabel!
    var mainView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        // Main View
        mainView = UIView()
        self.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        // Temperature Label
        temperatureLabel = UILabel()
        mainView.addSubview(temperatureLabel)
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8).isActive = true
        temperatureLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 8).isActive = true
        
        // City Label
        cityLabel = UILabel()
        mainView.addSubview(cityLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -8).isActive = true
        cityLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 8).isActive = true
        
        // Weather ImageView
        weatherImage = UIImageView()
        mainView.addSubview(weatherImage)
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8).isActive = true
        weatherImage.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 8).isActive = true
    }
    
    public func fillData(with temperature: String, city: String, imageUrl: String) {
        
        temperatureLabel.text = temperature
        cityLabel.text = city
        
        if let imageUrl = URL(string: imageUrl) {
            weatherImage.af_setImage(withURL: imageUrl)
        }
        
    }
    
}
