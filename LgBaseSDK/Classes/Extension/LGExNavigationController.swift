//
//  LGExNavigationController.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/5/18.
//

import UIKit

extension UINavigationController {
    
//    setNeedsStatusBarAppearanceUpdate 后回调preferredStatusBarStyle方法
    
    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
