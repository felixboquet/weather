//
//  HistoryViewController.swift
//  weatherapp
//
//  Created by Felix Boquet on 17/01/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HistoryViewController: UIViewController {
    
    var historyViewModel: HistoryViewModel!
    
    var mainView: UIView!
    var test: UILabel!
    
    init(viewModel: HistoryViewModel) {
        super.init(nibName: nil, bundle: nil)
        historyViewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        
        // Main View
        mainView = UIView()
        mainView.backgroundColor = .white
        self.view.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        // Label bidon
        test = UILabel()
        test.text = "COUCOU"
        mainView.addSubview(test)
        
        test.translatesAutoresizingMaskIntoConstraints = false
        test.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        test.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
    }
    
    private func setupBindings() {
        
        
        
    }
    
}
