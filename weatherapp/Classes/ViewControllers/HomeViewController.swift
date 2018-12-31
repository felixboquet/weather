//
//  HomeViewController.swift
//  weatherapp
//
//  Created by Felix Boquet on 26/12/2018.
//  Copyright © 2018 Felix Boquet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, StoryboardInitializable {
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    
    var networkProvider: NetworkManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkProvider = NetworkManager()
        
    }
}
