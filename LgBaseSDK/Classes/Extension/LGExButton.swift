//
//  LGExButton.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/1/4.
//

import UIKit

public extension UIButton {
    
    convenience init(text: String = "",
                     textColor: UIColor = .white,
                     textFont: UIFont = .font(16)) {
        self.init()
        
        setTextColor(textColor)
        setText(text)
        setTextFont(textFont)
    }
    
    /// 设置文本颜色
    /// - Parameter color: 颜色
    /// - Returns: 返回本身
    @discardableResult
    func setTextColor(_ color: UIColor,
                      state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    /// 设置文本内容
    /// - Parameter value: 内容
    /// - Returns: 返回本身
    @discardableResult
    func setText(_ value: String,
                 state: UIControl.State = .normal) -> Self {
        setTitle(value, for: state)
        return self
    }
    
    @discardableResult
    func setBackgroundImage(_ image: UIImage?,
                           state: UIControl.State = .normal) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func setImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func setTextFont(_ font: UIFont) -> Self {
        titleLabel?.font = font
        return self
    }
}
