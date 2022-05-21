//
//  NewsViewModel.swift
//  News Hub
//
//  Created by Mac on 3/21/22.
//  Copyright © 2022 ramy. All rights reserved.
//

import Foundation

struct NewsViewModel {
    
    let news: News
    
    var author: String {
        return news.author ?? VMString.auther
    }
    
    var title: String {
        return news.title ?? VMString.emptyString
    }
    
    var description: String {
        return news.description ?? VMString.emptyString
    }
    
    var url: String {
        return news.url ?? VMString.emptyString
    }
    
    var urlImage: String {
        return news.urlToImage ?? VMString.emptyString
    }
}
