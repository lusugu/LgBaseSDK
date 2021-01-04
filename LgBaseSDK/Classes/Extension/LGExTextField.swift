//
//  LGExTextField.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/1/4.
//

import UIKit

extension UITextField {
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
