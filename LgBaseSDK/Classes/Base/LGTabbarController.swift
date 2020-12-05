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
                var vc: UIViewController?
                if item.viewModel!.isKind(of: LGTableViewModel.classForCoder()) {
                    vc = (item.viewModel! as! LGTableViewModel).toViewController()
                }
                else if item.viewModel!.isKind(of: LGViewModel.classForCoder()) {
                    vc = (item.viewModel! as! LGViewModel).toViewController()
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
    var viewModel: AnyObject!
    
    public init(title: String, image: String, imageSelect: String, viewModel: AnyObject) {
        self.title = title
        self.image = image
        self.imageSelect = imageSelect
        self.viewModel = viewModel
    }
}
