//
//  LGTableViewController.swift
//  LGKit
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit

open class LGTableViewController: LGViewController {
    //MARK: - 初始化方法
//    public required init(viewModel: LGTableViewModel) {
//        super.init(nibName: nil, bundle: nil)
//        self.baseViewModel = viewModel
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

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
        
        setUpViews()
        setUpConstraints()
        viewEvent()
        tableViewEx()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @objc open func tableViewEx() {
        
    }
}

