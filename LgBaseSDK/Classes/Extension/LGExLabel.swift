//
//  LGExLabel.swift
//  Differentiator
//
//  Created by 鲁术光 on 2020/12/18.
//

import UIKit

extension UILabel {
    /// 字体大小
    @discardableResult
    public func lgFontSize(_ size: CGFloat) -> Self {
        font = .systemFont(ofSize: size)
        return self
    }
    
    /// 设置文本颜色
    /// - Parameter color: 颜色
    /// - Returns: 返回本身
    @discardableResult
    public func lgTextColor(_ color: UIColor) -> Self {
        textColor = color
        return self
    }
    
    /// 设置文本内容
    /// - Parameter value: 内容
    /// - Returns: 返回本身
    @discardableResult
    public func lgText(_ value: String) -> Self {
        text = value
        return self
    }
}
