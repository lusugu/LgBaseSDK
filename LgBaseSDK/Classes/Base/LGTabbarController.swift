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
        
        setUpViews()
        setUpConstraints()
        viewEvent()
    }
    
    //MARK: - attribute
    open var items: [TabbarItem] = [] {
        didSet {
            var navs: [UINavigationController] = []
            for item in items {
                var nav : UINavigationController?
                var vc: UIViewController? = item.viewModel?.toViewController()
                if let _ = vc {
                    nav = UINavigationController(rootViewController: vc!)
                }
                else {
                    vc = item.tableViewModel?.toViewController()
                    if let _ = vc {
                        nav = UINavigationController(rootViewController: vc!)
                    }
                }
                
                if let _ = vc {
                    nav!.tabBarItem.title = item.title
                    nav!.tabBarItem.image = UIImage(named: item.image)?.withRenderingMode(.alwaysOriginal)
                    nav!.tabBarItem.selectedImage = UIImage(named: item.imageSelect)?.withRenderingMode(.alwaysOriginal)
                    navs.append(nav!)
                }
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
    var viewModel: LGViewModel?
    var tableViewModel: LGTableViewModel?
    
    public init(title: String, image: String, imageSelect: String, viewModel: LGViewModel? = nil , tableViewModel: LGTableViewModel? = nil) {
        self.title = title
        self.image = image
        self.imageSelect = imageSelect
        self.viewModel = viewModel
        self.tableViewModel = tableViewModel
    }
}
