//
//  LGExButton.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/1/4.
//

import UIKit

public extension UIButton {
    
    /// 设置文本颜色
    /// - Parameter color: 颜色
    /// - Returns: 返回本身
    @discardableResult
    public func lgTextColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    /// 设置文本内容
    /// - Parameter value: 内容
    /// - Returns: 返回本身
    @discardableResult
    public func lgText(_ value: String, state: UIControl.State = .normal) -> Self {
        setTitle(value, for: state)
        return self
    }
    
    @discardableResult
    public func lgBackgroundImage(_ image: UIImage, state: UIControl.State = .normal) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func lgImage(_ image: UIImage, state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func lgTextFont(_ size: CGFloat) -> Self {
        titleLabel?.font = .font(size)
        return self
    }
}
