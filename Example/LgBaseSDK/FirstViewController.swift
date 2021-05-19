//
//  FirstViewController.swift
//  LgBaseSDK_Example
//
//  Created by 鲁术光 on 2021/5/18.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import LgBaseSDK

class FirstViewController: LGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue

//        navBarBackgroundColor = .red
        navBarTitleColor = .white
        title = "测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2"
        currentStatusBarStyle = .lightContent
        titleColor = .white
        setLeftBtn("返回", image: UIImage(named: "icon")!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
