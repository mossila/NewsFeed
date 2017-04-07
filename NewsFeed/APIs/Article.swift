//
//  Article.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import UIKit
import ObjectMapper

struct Article: Mappable {
    var title: String!
    var description: String!
    var urlToImage: URL!
    var url: URL!
    
    // MARK: JSON
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        urlToImage <- map["urlToImage"]
        url <- map["url"]
        
    }
}
