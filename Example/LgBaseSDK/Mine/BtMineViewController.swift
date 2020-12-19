//
//  BtMineViewController.swift
//  BellTone
//
//  Created by 鲁术光 on 2020/12/7.
//

import UIKit
import LgBaseSDK

class BtMineViewController: LGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navBarBarTintColor = .red
        
        let img = UIImageView()
        img.image = UIImage(named: "icon")
        view.addSubview(img)
        
        img.snpLeft(20)
            .snpWidth(20)
            .snpHeight(20)
            .snpTop(200)
            .drawConstraints()
        
        let l = UILabel()
        l.text = "测试12"
        l.textColor = .red
        l.backgroundColor = .yellow
        view.addSubview(l)
        
        l.snpLeft(10, sLConstraint: img.snp.right)
            .snpHeight(100)
            .snpCenterY(0, yConstraint: img.snp.centerY)
            .drawConstraints()
    }
    
    

}
