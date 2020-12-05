//
//  LGLabel.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit

open class LGLabel: UILabel {
    
    open var showLine: Bool = false {
        didSet {
            self.vLine.isHidden = !showLine
            self.vLine.backgroundColor = self.textColor
        }
    }
    
    private lazy var vLine: UIView = {
        let l = UIView()
        l.backgroundColor = .darkGray
        l.isHidden = true
        self.addSubview(l)
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpConstraints()
        viewEvent()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func setUpConstraints() {
        super.setUpConstraints()

        vLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(0.5)
        }
    }
}
