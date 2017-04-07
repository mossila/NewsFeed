//
//  NewsListViewController.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import UIKit
import ObjectMapper
import SDWebImage

class NewsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var articles:[Article]!
    lazy var model:NewsAPIProtocol = NewsAPIModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        articles = []
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 180
        model.getNewsList { [weak self](articles, error) in
            guard let strongSelf = self, articles != nil else {
                return
            }
            strongSelf.articles = articles
            strongSelf.tableView.reloadData()
        }
        
    }
}

// MARK : TableViewDelegate
extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}

// MARK:  TableViewDataSoruce
extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as! NewsTableViewCell
        newsCell.setupDefaultCell()
        let article = articles[indexPath.row]
        newsCell.headingLbl.text = article.title
        newsCell.descriptionLbl.text = article.description
        newsCell.newsImage.sd_setImage(with: article.urlToImage, placeholderImage: UIImage(named: "placeholder_tc"))
        newsCell.newsImage.setShowActivityIndicator(true)
        newsCell.newsImage.setIndicatorStyle(.gray)
        return newsCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}
