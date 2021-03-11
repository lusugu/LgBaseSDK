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
            .lgFontSize(12)
        l.lgText("上午安抚")
        l.lgTextColor(.red)
        l.frame = CGRect(x: 100, y: 60, width: 150, height: 50)
        view.addSubview(l)
        
        // Do any additional setup after loading the view.
        let btn: LGButton = LGButton(type: .right)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.setTitle(title: "12", state: .normal)
        btn.setImageColor(image: UIImage(named: "icon"), state: .normal)
        self.view.addSubview(btn)
        
        let btn2: LGButton = LGButton(type: .top)
        btn2.frame = .frame(x: 100, y: 200, width: 100, height: 100)
        btn2.setTitle(title: "12", state: .normal)
        btn2.setTitle(title: "34", state: .selected)
        btn2.backgroundColor = .red
        btn2.setImageColor(image: UIImage(named: "icon"), state: .normal)
        self.view.addSubview(btn2)
        
        let btn3: LGButton = LGButton(type: .left)
        btn3.frame = .frame(x: 100, y: 300, width: 100, height: 100)
        btn3.setTitle(title: "12", state: .normal)
        btn3.setTitle(title: "56", state: .selected)
        btn3.setTitleColor(color: .red, state: .selected)
        btn3.setBackgroundColor(color: .orange, state: .selected)
        btn3.setBackgroundColor(color: .lightGray, state: .normal)
        btn3.setImageColor(image: UIImage(named: "icon"), state: .normal)
        self.view.addSubview(btn3)
        
        let btn4: LGButton = LGButton(type: .bottom)
        btn4.setTitle(title: "12", state: .normal)
        btn4.setImageColor(image: UIImage(named: "icon"), state: .normal)
        self.view.addSubview(btn4)
        btn4.snpLeft(100.size)
            .snpTop(400.size)
            .snpWidth(100.size)
            .snpHeight(100.size)
            .drawConstraints()
        btn4.backgroundColor = .yellow
        
        btn2.rx.controlEvent(.touchUpInside).subscribe { (e) in
            btn2.isSelected = !btn2.isSelected
        }
        
        btn3.rx.controlEvent(.touchUpInside).subscribe { (e) in
            btn3.isSelected = !btn3.isSelected
        }
        
        print(scale)
    }
}
