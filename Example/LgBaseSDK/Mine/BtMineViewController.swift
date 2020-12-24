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
        
        img.snpLeft(offset: 20)
            .snpWidth(offset: 20)
            .snpHeight(offset: 20)
            .snpTop(offset: 200)
            .drawConstraints()
        
        let l = UILabel()
        l.text = "测试12"
        l.textColor = .red
        l.backgroundColor = .yellow
        view.addSubview(l)
        
        l.snpLeft(img.snp.right, offset: 10)
            .snpHeight(offset: 100)
            .snpCenterY(img.snp.centerY)
            .drawConstraints()
    }
    
    

}
