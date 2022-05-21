//
//  News.swift
//  News Hub
//
//  Created by Mac on 3/21/22.
//  Copyright © 2022 ramy. All rights reserved.
//

import Foundation

struct News: Codable {
    
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}

struct NewsCase: Codable {
    
    let status: String?
    let totalResults: Int?
    let articles: [News]
}
