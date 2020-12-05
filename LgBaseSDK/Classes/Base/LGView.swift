//
//  LGView.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

open class LGView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpConstraints()
        self.viewEvent()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
