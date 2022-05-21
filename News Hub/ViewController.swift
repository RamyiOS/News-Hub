//
//  ViewController.swift
//  News Hub
//
//  Created by Mac on 3/20/22.
//  Copyright © 2022 ramy. All rights reserved.
//

import UIKit
import SafariServices

class NewsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var viewModel = NewsListViewModel()
    private lazy var titleView: TitleView = {
       let view = TitleView(fontSize: 32)
        return view
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}

extension

