//
//  LGTabbarController.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

open class LGTabbarController: UITabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.isTranslucent = false
    }
    
    //MARK: - attribute
    open var items: [TabbarItem] = [] {
        didSet {
            var navs: [UINavigationController] = []
            for item in items {
                let m: AnyObject = item.viewModel.initialize() as AnyObject
                var vc: UIViewController?
                if m.isKind(of: LGTableViewModel.classForCoder()) {
                    vc = (m as! LGTableViewModel).toViewController()
                }
                else if m.isKind(of: LGViewModel.classForCoder()) {
                    vc = (m as! LGViewModel).toViewController()
                }
                
                let nav = UINavigationController(rootViewController: vc!)
                nav.tabBarItem.title = item.title
                nav.tabBarItem.image = UIImage(named: item.image)?.withRenderingMode(.alwaysOriginal)
                nav.tabBarItem.selectedImage = UIImage(named: item.imageSelect)?.withRenderingMode(.alwaysOriginal)
                navs.append(nav)
            }

            self.viewControllers = navs
        }
    }
    open var tintColor: UIColor? {
        didSet {
            self.tabBar.tintColor = tintColor
        }
    }
    open var barTintColor: UIColor? {
        didSet {
            self.tabBar.barTintColor = barTintColor
        }
    }

}

public struct TabbarItem {
    var title: String = ""
    var image: String = ""
    var imageSelect: String = ""
    var viewModel: AnyClass!
    
    public init(title: String, image: String, imageSelect: String, viewModel: AnyClass) {
        self.title = title
        self.image = image
        self.imageSelect = imageSelect
        self.viewModel = viewModel
    }
}
