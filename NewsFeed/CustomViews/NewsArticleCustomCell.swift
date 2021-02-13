//
//  NewsArticleCustomCell.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
//  Copyright © 2021 BetterUp. All rights reserved.
//

import UIKit

class NewsArticleCustomCell: UITableViewCell {
    
    private var newsArticles = [Article]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var newsTitle: UILabel = {
        let newsTitle = UILabel()
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.numberOfLines = 2
        newsTitle.lineBreakMode = .byTruncatingTail
        newsTitle.adjustsFontSizeToFitWidth = false
        newsTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
        return newsTitle
    }()
    
    lazy var newsDescription: UILabel = {
        let newsDescription = UILabel()
        newsDescription.translatesAutoresizingMaskIntoConstraints = false
        newsDescription.numberOfLines = 2
        newsDescription.lineBreakMode = .byTruncatingTail
        newsDescription.adjustsFontSizeToFitWidth = false
        newsDescription.font = UIFont.systemFont(ofSize: 14.0)
        return newsDescription
    }()
    
    lazy var favImg: UIImageView = {
        let favImg = UIImageView()
        favImg.translatesAutoresizingMaskIntoConstraints = false
        return favImg
    }()
    
    private func setupConstraints() {
        contentView.addSubview(newsTitle)
        contentView.addSubview(newsDescription)
        contentView.addSubview(favImg)
        let views = [
            "newsTitle"  : newsTitle,
            "newsDescription" : newsDescription,
            "favImg": favImg
        ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-34-[favImg(30)]", options: [], metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[newsTitle]-[newsDescription]-|", options: [], metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[newsTitle]-[favImg(30)]-|", options: [], metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[newsDescription]-[favImg(30)]-|", options: [], metrics: nil, views: views))
        //favImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
