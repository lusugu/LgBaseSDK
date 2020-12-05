//
//  LGKeyValueCell.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit
import RxSwift
import RxCocoa

open class LGKeyValueCell: LGBaseTableViewCell {
    
    open var tapBlock: (() -> Void)?
    
    @discardableResult
    open func toValue(value: String) -> Self {
        self.valueLabel.text = value
        return self
    }
    
    @discardableResult
    open func toValueAttri(attri: NSAttributedString) -> Self {
        self.valueLabel.attributedText = attri
        return self
    }
    
    @discardableResult
    open func toVColor(color: UIColor) -> Self {
        self.valueLabel.textColor = color
        return self
    }
    
    @discardableResult
    open func toVFont(font: UIFont) -> Self {
        self.valueLabel.font = font
        return self
    }
    
    @discardableResult
    open func toLike() -> Self {
        valueLabel.showLine = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapEvent))
        valueLabel.isUserInteractionEnabled = true
        valueLabel.addGestureRecognizer(tap)
        return self
    }
    
    @objc private func tapEvent() {
        self.tapBlock?()
    }
    
    //MARK: - private
    private lazy var valueLabel: LGLabel = {
        let l = LGLabel()
        l.font = .font(16)
        l.textColor = .darkGray
        childView.addSubview(l)
        return l
    }()

    open override func setUpConstraints() {
        super.setUpConstraints()

        valueLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-15);
            make.centerY.equalTo(childView)
        }
    }
    
    open override func viewEvent() {
        super.viewEvent()
        
    }
}
