//
//  NewsListViewControllerSpec.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import Quick
import Nimble
import Moya

@testable import NewsFeed

class MockNewsAPIModel: NewsAPIProtocol {
    var fetchCalled = false
    func getNewsList(complete:@escaping ([Article]?, MoyaError?) -> Void) {
        let json:[String:Any] = [ "title" : "Heading News",
                                  "description": "content",
                                  "urlToImage":"https://tctechcrunch2011.files.wordpress.com/2015/09/osmo.jpg?w=764&h=400&crop=1",
                                  "url": "https://techcrunch.com/2017/04/06/how-osmo-decides-to-make-its-tangible-high-tech-toys/",
                                  ]
        let article =  Article(JSON: json)!
        fetchCalled = true
        complete ([article], nil)
    }
}


class NewsListViewControllerSpec: QuickSpec {
    
    override func spec() {
        var newsListVC: NewsListViewController!
        describe("NewsListViewController") {
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                newsListVC =
                    storyboard.instantiateViewController(
                        withIdentifier: "NewsListViewController") as! NewsListViewController
                newsListVC.model = MockNewsAPIModel()
            }
            it("fetch data with data provider") {
                let mockModel = MockNewsAPIModel()
                newsListVC.model = mockModel
                expect(mockModel.fetchCalled).to(beFalse())
                let _ = newsListVC.view
                expect(mockModel.fetchCalled).to(beTrue())
            }
            it("set tableView") {
                let _ = newsListVC.view
                expect(newsListVC.tableView).to(beAnInstanceOf(UITableView.self))
            }
            
        }
        
    }
}
