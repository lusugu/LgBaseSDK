//
//  LGExtensionUIView.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit

@objc extension UIView {
    @objc open func setUpConstraints() {}
    @objc open func viewEvent() {}
}

@objc extension UIViewController {
    @objc open func setUpConstraints() {}
    @objc open func viewEvent() {}
}

public extension UIView {
    /// 背景颜色
    /// - Parameter color: 颜色
    /// - Returns: 返回本身
    @discardableResult
    func lgBackgroundColor<T: UIView>(_ color: UIColor) -> T {
        self.backgroundColor = color
        return self as! T
    }
}
