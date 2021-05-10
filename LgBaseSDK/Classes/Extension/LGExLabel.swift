//
//  LGExLabel.swift
//  Differentiator
//
//  Created by 鲁术光 on 2020/12/18.
//

import UIKit

public extension UILabel {
    
    convenience init(text: String = "",
                     font: UIFont = .font(15),
                     textColor: UIColor = .black) {
        self.init()
        
        setTextColor(textColor)
        setText(text)
        setFont(font)
    }
    
    /// 字体大小
    @discardableResult
    func setFont(_ font: UIFont) -> Self {
        self.font = font
        return self
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
    
    /// 设置文本内容
    /// - Parameter value: 内容
    /// - Returns: 返回本身
    @discardableResult
    func setNumberLine(_ number: Int) -> Self {
        numberOfLines = number
        return self
    }
}
