//
//  LGTableViewController.swift
//  LGKit
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit
import MJRefresh

open class LGTableViewController: LGViewController {
    
    /// 当前页码
    var curPage: Int = 1
    /// header
    var headerView: MJRefreshNormalHeader? {
        didSet {
            if let h = headerView {
                tableView.mj_header = h
            }
            else {
                tableView.mj_header = nil
            }
        }
    }
    var footerView: MJRefreshAutoNormalFooter? {
        didSet {
            if let f = footerView {
                tableView.mj_footer = f
            }
            else {
                tableView.mj_footer = nil
            }
        }
    }
    
    //MARK: - 初始化方法
    public lazy var tableView: UITableView = {
        let t = UITableView()
        t.estimatedRowHeight = 50
        t.rowHeight = UITableView.automaticDimension
        t.backgroundColor = UIColor(rgb: 0xF5F5F5)
        t.separatorStyle = .none
        view.addSubview(t)
        return t
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        
        tableViewEx()
    }

    @objc open func tableViewEx() {
        
    }
}

