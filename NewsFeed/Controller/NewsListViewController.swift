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
    var mockJSON:[[String:Any]] = [
            [
                "author": "Lora Kolodny",
                "title": "How Osmo decides to make its tangible, high-tech toys",
                "description": "Many toys today include high-tech and interactive components that keep kids in front of screens. But when it comes to health and educational development,..",
                "url": "https://techcrunch.com/2017/04/06/how-osmo-decides-to-make-its-tangible-high-tech-toys/",
                "urlToImage": "https://tctechcrunch2011.files.wordpress.com/2015/09/osmo.jpg?w=764&h=400&crop=1",
                "publishedAt": "2017-04-06T21:25:44Z"
            ],
            [
                "author": "Matthew Panzarino, Romain Dillet",
                "title": "Transcript: Phil Schiller, Craig Federighi and John Ternus on the state of Apple’s pro Macs",
                "description": "You have already read the news. But we thought we would also use this opportunity to share a transcript of the interview with Phil Schiller, Senior Vice..",
                "url": "https://techcrunch.com/2017/04/06/transcript-phil-schiller-craig-federighi-and-john-ternus-on-the-state-of-apples-pro-macs/",
                "urlToImage": "https://tctechcrunch2011.files.wordpress.com/2017/04/170403_macroundtable_bk_7171.jpg?w=764&h=400&crop=1",
                "publishedAt": "2017-04-06T19:35:20Z"
            ],
            [
                "author": "Sarah Buhr",
                "title": "23andMe is finally allowed to tell you if you have the genes for Parkinson’s",
                "description": "The Food and Drug Administration finally gave 23andMe a long sought-after green light today to sell to consumers genetic tests and their accompanying health..",
                "url": "https://techcrunch.com/2017/04/06/23andme-is-finally-allowed-to-tell-you-if-you-have-the-genes-for-parkinsons/",
                "urlToImage": "https://tctechcrunch2011.files.wordpress.com/2013/11/23andme-blimp.jpg?w=764&h=400&crop=1",
                "publishedAt": "2017-04-06T18:54:43Z"
            ],
            [
                "author": "Josh Constine",
                "title": "Facebook Messenger’s AI ‘M’ suggests features to use based on your convos",
                "description": "Write \"You owe me $20\" and Messenger will suggest you use its payments feature. If someone says \"goodbye,\" Messenger will recommend a \"bye-bye\" GIF. That's..",
                "url": "https://techcrunch.com/2017/04/06/facebook-messengers-ai-m-suggests-features-to-use-based-on-your-convos/",
                "urlToImage": "https://tctechcrunch2011.files.wordpress.com/2017/04/facebook-m-suggestions.jpg?w=764&h=400&crop=1",
                "publishedAt": "2017-04-06T17:01:47Z"
            ],
            [
                "author": "Frederic Lardinois",
                "title": "New Google tool helps developers pick the right colors for their apps",
                "description": "With its Material Design guidelines, Google set out to create a unified set of ideas for how it wants developers to think about all the different aspects of..",
                "url": "https://techcrunch.com/2017/04/06/new-google-tool-helps-developers-pick-the-right-colors-for-their-apps/",
                "urlToImage": "https://tctechcrunch2011.files.wordpress.com/2017/04/gettyimages-158318188.jpg?w=764&h=400&crop=1",
                "publishedAt": "2017-04-06T17:00:32Z"
            ]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        articles = Mapper<Article>().mapArray(JSONArray: mockJSON)!
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 178
        tableView.reloadData()
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
