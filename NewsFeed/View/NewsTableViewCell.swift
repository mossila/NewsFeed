//
//  NewsTableViewCell.swift
//  NewsFeed
//
//  Created by Mossial on 4/7/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var headingLbl: UILabel!
}
