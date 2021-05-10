//
//  LGExTextView.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/1/4.
//

import UIKit

public extension UITextView {
    
    convenience init(text: String = "",
                     color: UIColor = .black) {
        self.init()
        self.setText(text)
            .setTextColor(color)
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
    
}
