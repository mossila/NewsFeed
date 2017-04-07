//
//  NewsListViewControllerSpec.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import Quick
import Nimble

@testable import NewsFeed

class NewsListViewControllerSpec: QuickSpec {
    
    override func spec() {
        var newsListVC: NewsListViewController!
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            newsListVC =
                storyboard.instantiateViewController(
                    withIdentifier: "NewsListViewController") as! NewsListViewController
        }
        describe(".viewDidLoad") { 
            beforeEach {
                let _ = newsListVC.view
            }
            it("set tableView") {
                expect(newsListVC.tableView).to(beAnInstanceOf(UITableView.self))
            }
        }
    }
}
