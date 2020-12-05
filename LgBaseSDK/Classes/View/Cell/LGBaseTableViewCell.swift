//
//  LGBaseTableViewCell.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa

open class LGBaseTableViewCell: LGTableViewCell {
    //MARK: - attritute
    @discardableResult
    open func toKey(key: String) -> Self {
        self.keyLabel.text = key
        return self
    }
    
    @discardableResult
    open func toKColor(color: UIColor) -> Self {
        self.keyLabel.textColor = color
        return self
    }
    
    @discardableResult
    open func toKFont(font: UIFont) -> Self {
        self.keyLabel.font = font
        return self
    }
    
    @discardableResult
    open func cellHeight(height: CGFloat) -> Self {
        self.childView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(height).priority(999)
        }
        return self
    }
    
    //MARK: - private
    private lazy var keyLabel: UILabel = {
        let l = UILabel()
        l.font = .font(16)
        l.textColor = .black
        childView.addSubview(l)
        return l
    }()

    open override func setUpConstraints() {
        super.setUpConstraints()
        
        keyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(childView)
        }
    }
    
    open override func viewEvent() {
        super.viewEvent()
        
        self.selectionStyle = .none
    }

}
