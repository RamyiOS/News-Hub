//
//  APIMnager.swift
//  News Hub
//
//  Created by Mac on 3/21/22.
//  Copyright © 2022 ramy. All rights reserved.
//

import Foundation

class APIManager {
    
    let cashedImage = NSCache<NSString, NSData>()
    
    static let shared = APIManager()
    private init () {}
    
    private let baseUrl = apiUrlString.baseUrl
    private let usHeadlines = apiUrlString.usHeadlines
    
    
    func getNews(completion: @escaping (([News]?) -> Void)) {
        let urlString = "\(baseUrl)\(usHeadlines)&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsCase = try? JSONDecoder().decode(NewsCase.self, from: data)
            newsCase == nil ? completion(nil) : completion(newsCase?.articles)
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cashedImage = cashedImage.object(forKey: NSString(string: urlString)) {
            completion(cashedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.cashedImage.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
