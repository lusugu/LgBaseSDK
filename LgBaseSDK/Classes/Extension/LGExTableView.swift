//
//  LGExTableView.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2020/12/12.
//

import UIKit

extension UITableView {
    @objc public class func `default`() -> UITableView {
        let tableView = UITableView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        return tableView
    }
}
