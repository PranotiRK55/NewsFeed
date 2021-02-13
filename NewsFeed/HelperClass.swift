//
//  HelperClass.swift
//  NewsFeed
//
//  Created by PRANOTI KULKARNI on 2/13/21.
//  Copyright © 2021 BetterUp. All rights reserved.
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
