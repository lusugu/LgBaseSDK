//
//  LGExtensionUIView.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit
import SnapKit

@objc extension UIView {
    @objc open func setUpConstraints() {}
    @objc open func setUpViews() {}
    @objc open func viewEvent() {}
    
    convenience init(_ bgColor: UIColor) {
        self.init()
        
        setBgColor(bgColor)
    }
    
    /// 背景颜色
    /// - Parameter color: 颜色
    /// - Returns: 返回本身
    @discardableResult
    func setBgColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    
    //MARK: - 圆角
    /// 有圆角就不能设置阴影
    @discardableResult
    func viewBorderRadius(radius: CGFloat, width: CGFloat = 0.5, color: UIColor = .clear) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        return self
    }
}

@objc extension UIViewController {
    @objc open func setUpConstraints() {}
    @objc open func setUpViews() {}
    @objc open func viewEvent() {}
}
