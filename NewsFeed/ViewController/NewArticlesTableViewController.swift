//
//  NewArticlesTableViewController.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
//

import UIKit
import SwiftUI

class NewsArticlesTableViewController: UIViewController {
    
    private enum Constants {
        static let tableViewAccessibilityIdentifier = "articlesTableView"
        static let navigationTitle = "Articles"
    }
    
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
        
        //accessibility identifier for UI Tests
        self.newsFeedTableView.accessibilityIdentifier = Constants.tableViewAccessibilityIdentifier
        
        //enable auto layout for tableview
        self.newsFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //hide extra lines
        self.newsFeedTableView.tableFooterView = UIView()
        
        self.view.addSubview(self.newsFeedTableView)
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.newsFeedTableView.deselectSelectedRow(animated: true)
    }
    
    private func setupNavBar() {
        navigationItem.title = Constants.navigationTitle
        self.navigationController?.navigationBar.barTintColor = .lightGray
    }
    
    private func setUpConstraints() {
        //auto layout constraints for the table view
        NSLayoutConstraint.activate([
            newsFeedTableView.topAnchor
                .constraint(equalTo: view.topAnchor),
            newsFeedTableView.leftAnchor
                .constraint(equalTo: view.leftAnchor),
            newsFeedTableView.bottomAnchor
                .constraint(equalTo: view.bottomAnchor),
            newsFeedTableView.rightAnchor
                .constraint(equalTo: view.rightAnchor)
        ])
    }
}

// MARK: - TABLEVIEWDATASOURCE AND DELEGATE METHODS
extension NewsArticlesTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    //when user taps on the row should navigate to webView that shows the news article
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webView = NewsArticleWebViewUsingSwiftUI(myURL: self.newsArticles[indexPath.row].link)
        let webViewVC = UIHostingController(rootView: webView)
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    //number of rows for that section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArticles.count
    }
    
    //render the cell and display data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NewsArticleCustomCell(article: self.newsArticles[indexPath.row])
    }
}

// MARK: - PARSE JSON DATA FROM FILE
extension NewsArticlesTableViewController {
    private func readAndLoadJsonData() {
        guard let path = Bundle.main.url(forResource: "articles", withExtension: "json") else { return }
        
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
