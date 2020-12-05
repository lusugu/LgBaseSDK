//
//  LGKeyValuesCell.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/24.
//

import UIKit

public class LGKeyValuesCell: LGBaseTableViewCell {
    open var tapBlock: ((Int) -> Void)?
    
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
    open func toValue2(value: String) -> Self {
        self.value2Label.text = value
        return self
    }
    
    @discardableResult
    open func toValueAttri2(attri: NSAttributedString) -> Self {
        self.value2Label.attributedText = attri
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
    open func toV2Color(color: UIColor) -> Self {
        self.value2Label.textColor = color
        return self
    }
    
    @discardableResult
    open func toV2Font(font: UIFont) -> Self {
        self.value2Label.font = font
        return self
    }
    
    @discardableResult
    open func toLike(index: Int) -> Self {
        if index == 0 {
            valueLabel.showLine = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapEvent))
            valueLabel.isUserInteractionEnabled = true
            valueLabel.addGestureRecognizer(tap)
        }
        else {
            value2Label.showLine = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(tap2Event))
            value2Label.isUserInteractionEnabled = true
            value2Label.addGestureRecognizer(tap)
        }
        return self
    }
    
    @objc private func tapEvent() {
        self.tapBlock?(0)
    }
    
    @objc private func tap2Event() {
        self.tapBlock?(1)
    }
    
    //MARK: - private
    private lazy var valueLabel: LGLabel = {
        let l = LGLabel()
        l.font = .font(16)
        l.textColor = .darkGray
        childView.addSubview(l)
        return l
    }()
    
    private lazy var value2Label: LGLabel = {
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
        
        value2Label.snp.makeConstraints { (make) in
            make.right.equalTo(self.valueLabel.snp.left).offset(-5);
            make.centerY.equalTo(childView)
        }
    }
}
