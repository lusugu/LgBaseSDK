//
//  LGTableViewController.swift
//  LGKit
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit
import GTMRefresh

open class LGTableViewController: LGViewController {
    
    /// 当前页码
    open var curPage: Int = 1
    open var needLoadMore: Bool = false {
        didSet {
            if needLoadMore {
                tableView.gtm_addLoadMoreFooterView { [weak self] in
                    self?.loadMore()
                }
            }
        }
    }
    
    open var needRefresh: Bool = false {
        didSet {
            if needLoadMore {
                tableView.gtm_addRefreshHeaderView { [weak self] in
                    self?.refresh()
                }
            }
        }
    }
    
    open var noMore: Bool = false {
        didSet {
            tableView.endLoadMore(isNoMoreData: noMore)
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
    
    open func loadMore() {
        
    }
    
    open func refresh()  {
        
    }
}

