//
//  HelperClass.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/12/21.
//

import UIKit

extension UITableView {
    
    func deselectSelectedRow(animated: Bool)
    {
        if let indexPathForSelectedRow = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }
}
