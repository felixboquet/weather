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
    var tableView: UITableView = UITableView(frame: CGRect.zero)
    private let disposeBag = DisposeBag()
    
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
        
        // Table View
        setupTableView()
        
    }
    
    private func setupTableView() {
        
        super.viewDidLayoutSubviews()
        
        let tableView = UITableView()
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryTableViewCell")
        self.tableView = tableView
        mainView.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo:  mainView.rightAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
        
    }
    
    private func setupBindings() {
        
        
    }
    
}
