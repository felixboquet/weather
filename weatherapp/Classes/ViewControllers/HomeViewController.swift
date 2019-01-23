//
//  HomeViewController.swift
//  weatherapp
//
//  Created by Felix Boquet on 26/12/2018.
//  Copyright © 2018 Felix Boquet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    var temperatureLabel: UILabel!
    var weatherImage: UIImageView!
    var cityLabel: UILabel!
    var mainView: UIView!
    var refreshButton: UIButton!
    var historyButton: UIButton!
    
    var viewModel: HomeViewModel!
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: HomeViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupBindings()
        self.initObserver()
        
    }
    
    private func setupUI() {
        
        // Main View
        mainView = UIView()
        mainView.backgroundColor = .white
        self.view.addSubview(self.mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        // City label
        cityLabel = UILabel()
        cityLabel.text = "Toulouse"
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont(name: cityLabel.font.fontName, size: 20)
        mainView.addSubview(cityLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        cityLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        
        // Temperature label
        temperatureLabel = UILabel()
        temperatureLabel.text = "5°C"
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = UIFont(name: temperatureLabel.font.fontName, size: 40)
        mainView.addSubview(temperatureLabel)
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.bottomAnchor.constraint(equalTo: cityLabel.topAnchor, constant: -32).isActive = true
        temperatureLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        
        // Weather image
        weatherImage = UIImageView()
        weatherImage.image = UIImage(named: "sun")
        mainView.addSubview(weatherImage)
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: -32).isActive = true
        weatherImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: 128).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: 128).isActive = true
        
        // Refresh button
        refreshButton = UIButton()
        refreshButton.setImage(UIImage(named: "location"), for: UIControl.State.normal)
        mainView.addSubview(refreshButton)
        
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 32).isActive = true
        refreshButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        refreshButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        refreshButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        // History button
        historyButton = UIButton()
        historyButton.setImage(UIImage(named: "history"), for: UIControl.State.normal)
        mainView.addSubview(historyButton)
        
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        historyButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 96).isActive = true
        historyButton.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -32).isActive = true
        historyButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        historyButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
    }
    
    private func setupBindings() {

        refreshButton.rx.tap.flatMap {[weak viewModel] () -> Single<String> in
            if let viewModel = viewModel {
                return viewModel.getLocalWeather()
            }
            return Single<String>.never()
        }.bind(to: temperatureLabel.rx.text)
        .disposed(by: disposeBag)
        
        historyButton.rx.tap.bind(onNext: { [weak viewModel] in
            guard let viewModel = viewModel else {
                return
            }
            viewModel.didTouchGoHistory()
            
        }).disposed(by: disposeBag)

    }
    
    private func initObserver() {
        
        viewModel.historyRelay.bind(onNext: { [weak self] (history) in
            guard let me = self, let history = history else {
                return
            }
            
            me.temperatureLabel.text = history.temperature
            
        }).disposed(by: disposeBag)
        
    }
}
