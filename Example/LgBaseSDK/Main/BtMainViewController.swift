//
//  BTMainViewController.swift
//  BellTone
//
//  Created by 鲁术光 on 2020/12/7.
//

import UIKit
import LgBaseSDK

class BtMainViewController: LGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let l = UILabel()
            .setFont(.font(12))
        l.setText("上午安抚")
        l.setTextColor(.red)
        l.frame = CGRect(x: 100, y: 60, width: 150, height: 50)
        view.addSubview(l)
        
        // Do any additional setup after loading the view.
        let btn: LGButton = LGButton(type: .right)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.setTitle(title: "12", state: .normal)
        btn.setImageColor(image: UIImage(named: "icon"), state: .normal)
        self.view.addSubview(btn)
        
        btn.rx.controlEvent(.touchUpInside).subscribe { [weak self] (e) in
            let vc = FirstViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        navBarBackgroundColor = .yellow
        title = "测试"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
