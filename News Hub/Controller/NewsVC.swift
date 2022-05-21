//
//  ViewController.swift
//  News Hub
//
//  Created by Mac on 3/20/22.
//  Copyright © 2022 ramy. All rights reserved.
//

import UIKit
import SafariServices

class NewsVC: UIViewController {
    
    var viewModel = NewsListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configer()
    }
    
    
    private lazy var titleView: TitleView = {
        let view = TitleView(fontSize: 32)
        return view
    }()
    //done
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseIdentifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private func configer() {
        loadNews()
        addViews()
        layoutUI()
    }
    
    private func loadNews() {
        viewModel.getNews { (_) in
            self.tableView.reloadData()
        }
    }
    
    private func addViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(titleView)
        view.addSubview(tableView)
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier, for: indexPath) as? NewsTableViewCell
        
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsVM = news
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        guard let url = URL(string: news.url) else {return}
        
        let configer = SFSafariViewController.Configuration()
        let safariVC = SFSafariViewController(url: url, configuration: configer)
        safariVC.modalPresentationStyle = .fullScreen
        present(safariVC, animated: true)
    }
}

