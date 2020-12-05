//
//  LGViewController.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

open class LGViewController: UIViewController {

    //MARK: - 初始化方法
    public required init(viewModel: LGViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.baseViewModel = viewModel
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        setUpConstraints()
        viewEvent()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("=====================================================================")
        print(" \(NSStringFromClass(self.classForCoder)) viewWillAppear ")
        print("=====================================================================")
    }
    
    //MARK: - attribute
    var baseViewModel: LGViewModel!
}
