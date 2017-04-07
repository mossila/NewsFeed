//
//  Article.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import UIKit
import ObjectMapper

struct ArticleResponse: Mappable {
    var status: String!
    var source: String!
    var sortBy: String!
    var articles:[Article]!
    init?(map: Map) {
        guard map.JSON["status"] as? String != "ok",
            map.JSON["source"] != nil else {
                return nil
        }
    }
    mutating func mapping(map: Map) {
        status <- map["status"]
        source <- map["source"]
        sortBy <- map["sortBy"]
        articles <- map["articles"]
    }
}

struct Article: Mappable {
    var title: String!
    var description: String!
    var urlToImage: URL!
    var url: URL!
    
    // MARK: JSON
    init?(map: Map) {
        guard map.JSON["title"] != nil else { return nil}
        guard map.JSON["description"] != nil else { return nil}
        guard map.JSON["urlToImage"] != nil else { return nil}
        guard map.JSON["url"] != nil else { return nil}
        guard let urlToImage = map.JSON["urlToImage"], let _ = URL(string:urlToImage as! String) else { return nil }
        guard let url = map.JSON["url"], let _ = URL(string:url as! String) else { return nil }
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        urlToImage <- (map["urlToImage"], URLTransform())
        url <- (map["url"],URLTransform())
    }
}
