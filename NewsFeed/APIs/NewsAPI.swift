//
//  NewsAPIOrg.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import UIKit
import Moya

enum NewsAPI {
    case article(source:String)
}

// MARK: TargetType
extension NewsAPI: TargetType {
    var baseURL: URL { return URL(string: "https://newsapi.org/v1")! }
    var path: String {
        switch self {
        case .article:
            return "/articles"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .article:
            return .get
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .article(let soruce):
            return ["source":soruce, "apiKey":NewsAPI.apiKey]
        }
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .article:
            return URLEncoding.default
        }
    }
    var sampleData: Data {
        switch self {
        case .article:
            let json:[String:Any] = [
                "status": "ok",
                "source": "techcrunch",
                "sortBy": "top",
                "articles": [
                    [
                        "author": "Lora Kolodny",
                        "title": "How Osmo decides to make its tangible, high-tech toys",
                        "description": "Many toys today include high-tech and interactive components that keep kids in front of screens. But when it comes to health and educational development,..",
                        "url": "https://techcrunch.com/2017/04/06/how-osmo-decides-to-make-its-tangible-high-tech-toys/",
                        "urlToImage": "https://tctechcrunch2011.files.wordpress.com/2015/09/osmo.jpg?w=764&h=400&crop=1",
                        "publishedAt": "2017-04-06T21:25:44Z"
                    ]
                ]
            ]
            let jsonData = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            return jsonData
        }
    }
    var task: Task {
        switch self {
        case .article:
            return .request
        }
    }
}
// MARK: - Helper
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}

