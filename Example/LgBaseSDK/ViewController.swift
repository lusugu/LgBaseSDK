//
//  ViewController.swift
//  LgBaseSDK
//
//  Created by lusugu2004@163.com on 12/04/2020.
//  Copyright (c) 2020 lusugu2004@163.com. All rights reserved.
//

import UIKit
import LgBaseSDK

class ViewController: LGTabbarController {

    override func setUpConstraints() {
        super.setUpConstraints()
        
        let main = TabbarItem(title: "首页", image: "tabbar_class", imageSelect: "tabbar_class_hover", vc: BtMainViewController())
        let mine = TabbarItem(title: "我的", image: "tabbar_profile", imageSelect: "tabbar_profile_hover", vc: BtMineViewController())

        self.items = [main, mine];
        
        CGFloat.width
    }

}

