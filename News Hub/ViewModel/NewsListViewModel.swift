//
//  NewsListViewModel.swift
//  News Hub
//
//  Created by Mac on 3/21/22.
//  Copyright © 2022 ramy. All rights reserved.
//

import Foundation

class NewsListViewModel {
    
    var newsVM = [NewsViewModel]()
    var reuseIdentifier = reusableID.news
    
    func getNews(completion: @escaping ([NewsViewModel]) -> Void) {
        APIManager.shared.getNews { (news) in
            guard let news = news else {return}
            let newsVM = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}
