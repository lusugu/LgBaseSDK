//
//  LGKeyFeildCell.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa

open class LGKeyFeildCell: LGBaseTableViewCell {
    
    open var fieldText: String? {
        get {
            return self.textField.text
        }
        set {
            self.textField.text = newValue
        }
    }

    @discardableResult
    open func toValue(value: String) -> Self {
        self.textField.text = value
        return self
    }
    
    @discardableResult
    open func toPlaceholder(value: String) -> Self {
        self.textField.placeholder = value
        return self
    }
    
    @discardableResult
    open func toVColor(color: UIColor) -> Self {
        self.textField.textColor = color
        return self
    }
    
    @discardableResult
    open func toVFont(font: UIFont) -> Self {
        self.textField.font = font
        return self
    }
    
    //MARK: - private
    private lazy var textField: UITextField = {
        let l = UITextField()
        l.textAlignment = .right
        l.font = .font(16)
        childView.addSubview(l)
        return l
    }()

    open override func setUpConstraints() {
        super.setUpConstraints()

        textField.snp.makeConstraints { (make) in
            make.right.equalTo(-15);
            make.centerY.equalTo(childView)
        }
    }
    
    open override func viewEvent() {
        super.viewEvent()
        
    }

}
