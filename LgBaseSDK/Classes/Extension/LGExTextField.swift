//
//  LGExTextField.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/1/4.
//

import UIKit

public extension UITextField {
    
    convenience init(text: String = "",
         textColor: UIColor = .black) {
        self.init()
        
        setText(text)
        setTextColor(textColor)
    }
    
    /// 设置文本颜色
    /// - Parameter color: 颜色
    /// - Returns: 返回本身
    @discardableResult
    func setTextColor(_ color: UIColor) -> Self {
        textColor = color
        return self
    }
    
    /// 设置文本内容
    /// - Parameter value: 内容
    /// - Returns: 返回本身
    @discardableResult
    func setText(_ value: String) -> Self {
        text = value
        return self
    }
    
    @discardableResult
    func setFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func setPlaceholder(placeholder: String) -> Self {
        self.placeholder = placeholder
        return self
    }
    
    @discardableResult
    func setAlignment(alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        return self
    }
}
