//
//  NewArticlesTableViewController.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
//  Copyright © 2021 BetterUp. All rights reserved.
//

import Foundation
import UIKit

class NewsArticlesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var newsFeedTableView: UITableView!
    private var newsArticles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        readAndLoadJsonData()
        
        self.newsFeedTableView = UITableView()
        self.newsFeedTableView.dataSource = self
        self.newsFeedTableView.delegate = self
        
        self.newsFeedTableView.rowHeight = UITableView.automaticDimension
        
        //register custom cell
        self.newsFeedTableView.register(NewsArticleCustomCell.self, forCellReuseIdentifier: "ArticlesCell")
        
        //enable auto layout for tableview
        self.newsFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //hide extra lines
        self.newsFeedTableView.tableFooterView = UIView()
        
        self.view.addSubview(self.newsFeedTableView)
        
        //auto layout constraints for the table view
        NSLayoutConstraint.activate([
            newsFeedTableView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsFeedTableView.leftAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            newsFeedTableView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newsFeedTableView.rightAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.newsFeedTableView.deselectSelectedRow(animated: true)
    }
    
    private func setupNavBar() {
        navigationItem.title = "Articles"
        self.navigationController?.navigationBar.barTintColor = .lightGray
    }
    
    //custom delegation
    func updateFavoriteItem(cell: UITableViewCell) {
        guard let indexPath = newsFeedTableView?.indexPath(for: cell) else { return }
        if (self.newsArticles[indexPath.row].favorite == false) {
            self.newsArticles[indexPath.row].favorite = true
        } else {
            self.newsArticles[indexPath.row].favorite = false
        }
        self.newsFeedTableView.reloadData()
    }
}

extension NewsArticlesTableViewController {
    
    //when user taps on the row should navigate to webView that shows the news article
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webView = WebVCForNewsFeedViewController()
        webView.strURL = self.newsArticles[indexPath.row].link
        self.navigationController?.pushViewController(webView, animated: true)
    }
    
    //number of rows for that section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArticles.count
    }
    
    //render the cell and display data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesCell", for: indexPath) as! NewsArticleCustomCell
        cell.accessoryType = .disclosureIndicator
        cell.newsTitle.text = self.newsArticles[indexPath.row].title
        cell.newsDescription.text = self.newsArticles[indexPath.row].description
        
        let nonFilledImg = UIImage(imageLiteralResourceName: "star")
        let filledImg = UIImage(imageLiteralResourceName: "star_filled")
            
        if  self.newsArticles[indexPath.row].favorite == false {
            UIView.transition(with: cell.favImg,
                              duration: 0.75,
                              options: .transitionCrossDissolve,
                              animations: { cell.favImg.image =  nonFilledImg},
                              completion: nil)
        } else {
            UIView.transition(with: cell.favImg,
                              duration: 0.75,
                              options: .transitionCrossDissolve,
                              animations: { cell.favImg.image =  filledImg},
                              completion: nil)
        }
        
        cell.newsFeedVC = self
        
        return cell
    }
    
    //read json data from local file to make it readable in swift code.
    private func readAndLoadJsonData() {
        let path = Bundle.main.url(forResource: "articles", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            let news = try decoder.decode(News.self, from: jsonData)
            self.newsArticles = news.articles

            DispatchQueue.main.async {
                self.newsFeedTableView.reloadData()
            }
        }
        catch {
            print(error)
        }
    }
}
