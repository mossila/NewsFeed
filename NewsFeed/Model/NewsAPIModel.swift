//
//  NewsAPIModel.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import UIKit
import Moya
import Moya_ObjectMapper
struct Source {
    static let techCrunch = "techcrunch"
}
protocol NewsAPIProtocol {
    func getNewsList(complete:@escaping ([Article]?, MoyaError?) -> Void)
}
struct NewsAPIModel {
    let provider = MoyaProvider<NewsAPI>()
    func getNewsList(complete:@escaping ([Article]?, MoyaError?) -> Void) {
        provider.request(.article(source: Source.techCrunch)) { result in
            switch result {
            case let .success(moyaResponse) :
                guard let articleResponse =  try? moyaResponse.mapObject(ArticleResponse.self) else {
                    complete (nil, .jsonMapping(moyaResponse))
                    return
                }
                let articles = articleResponse.articles
                complete (articles, nil)
                return
            case let .failure(error):
                complete (nil, error)
                return
            }
        }
    }
}
