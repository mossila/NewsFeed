//
//  ArticleResponseSpec.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import NewsFeed

class ArticleResponseSpec: QuickSpec {
    
    override func spec() {
        describe("Article") {
            context("Some fields is missing") {
                it("can not init with out 'status'") {
                    let json:[String:Any]  =  [
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
                    let articleRespone = ArticleResponse(JSON: json)
                    expect(articleRespone).to(beNil())
                }
            }
            
            context("All field are set") {
                var articleRespone:ArticleResponse?
                let responseJSON :[String: Any] = [
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
                
                beforeEach {
                    articleRespone = ArticleResponse(JSON: responseJSON)
                }
                it("init success") {
                    expect(articleRespone).to(beAnInstanceOf(ArticleResponse.self))
                }
            }
        }
    }
}

