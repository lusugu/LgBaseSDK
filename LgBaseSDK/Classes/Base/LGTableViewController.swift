//
//  LGTableViewController.swift
//  LGKit
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit

open class LGTableViewController: LGViewController, UITableViewDelegate, UITableViewDataSource {
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
        t.delegate = self
        t.dataSource = self
        t.estimatedRowHeight = UITableView.automaticDimension
        t.rowHeight = 44
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
    
    func tableViewEx() {
        
    }

    // MARK: - Table view data source
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
