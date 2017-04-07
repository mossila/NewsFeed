//
//  ArticleSpec.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import Quick
import Nimble
import ObjectMapper

@testable import NewsFeed

class ArticleSpec: QuickSpec {
    
    override func spec() {
        describe("Article") {
            context("Some fields is missing") {
                it("can not init with no title") {
                    let jsonTitleMissing:[String:Any]  = [ "description": "content",
                                                           "urlToImage":"https://tctechcrunch2011.files.wordpress.com/2015/09/osmo.jpg?w=764&h=400&crop=1",
                                                           "url": "https://techcrunch.com/2017/04/06/how-osmo-decides-to-make-its-tangible-high-tech-toys/"]
                    let article = Article(JSON: jsonTitleMissing)
                    expect(article).to(beNil())
                }
                it("can not init with no url") {
                    let jsonTitleMissing:[String:Any]  = [ "title" : "Heading News",
                                                           "description": "content",
                                                           "urlToImage":"https://tctechcrunch2011.files.wordpress.com/2015/09/osmo.jpg?w=764&h=400&crop=1"]
                    let article = Article(JSON: jsonTitleMissing)
                    expect(article).to(beNil())
                }
                
                it("can not init with no description") {
                    let jsonTitleMissing:[String:Any]  = [ "title" : "Heading News",
                                                           "urlToImage":"https://tctechcrunch2011.files.wordpress.com/2015/09/osmo.jpg?w=764&h=400&crop=1",
                                                           "url": "https://techcrunch.com/2017/04/06/how-osmo-decides-to-make-its-tangible-high-tech-toys/"]
                    let article = Article(JSON: jsonTitleMissing)
                    expect(article).to(beNil())
                }
                
                it("can not init with no url to image") {
                    let jsonTitleMissing:[String:Any]  = [ "title" : "Heading News",
                                                           "description": "content",
                                                           "url": "https://techcrunch.com/2017/04/06/how-osmo-decides-to-make-its-tangible-high-tech-toys/"]
                    let article = Article(JSON: jsonTitleMissing)
                    expect(article).to(beNil())
                }
            }
            
            context("All fields are set.") {
                let json:[String:Any] = [ "title" : "Heading News",
                                          "description": "content",
                                          "urlToImage":"https://tctechcrunch2011.files.wordpress.com/2015/09/osmo.jpg?w=764&h=400&crop=1",
                                          "url": "https://techcrunch.com/2017/04/06/how-osmo-decides-to-make-its-tangible-high-tech-toys/",
                                          ]
                var article: Article?
                beforeEach {
                    article = Article(JSON: json)
                }
                it("init successful") {
                    expect(article).to(beAnInstanceOf(Article.self))
                }
                it("has title") {
                    expect(article?.title).to(equal("Heading News"))
                }
                it("has description") {
                    expect(article?.description).to(equal("content"))
                }
                it("has url") {
                    expect(article?.url).to(beAnInstanceOf(URL.self))
                }
                it("has url to image") {
                    expect(article?.urlToImage).to(beAnInstanceOf(URL.self))
                }
            }
            
            context("url is invalid") {
                it("has wrong url") {
                    let wrongURL:[String:Any]  = [ "title" : "Heading News",
                                                           "description": "content",
                                                           "urlToImage":"https://tctechcrunch2011.files.wordpress.com/2015/09/osmo.jpg?w=764&h=400&crop=1",
                                                           "url": "",
                                                           ]
                    let article = Article(JSON: wrongURL)
                    expect(article).to(beNil())
                }
                it("has wrong url to image") {
                    let wrongURLToImage:[String:Any]  = [ "title" : "Heading News",
                                                   "description": "content",
                                                   "urlToImage":"",
                                                   "url": "https://techcrunch.com/2017/04/06/how-osmo-decides-to-make-its-tangible-high-tech-toys/",
                                                   ]
                    let article = Article(JSON: wrongURLToImage)
                    expect(article).to(beNil())
                }
            }

            
        }
    }
    
}
