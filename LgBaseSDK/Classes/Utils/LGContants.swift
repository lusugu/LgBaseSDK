//
//  LGContants.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

private func iPhonex() -> Bool {
    var iPhoneX = false
    if #available(iOS 11.0, *) {
        if let window = UIApplication.shared.windows.first, window.safeAreaInsets.bottom > 0 {
            iPhoneX = true
        }
    }
    return iPhoneX
}

/// 是不是手机判断
public let jm_isPhone = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone

public let screenWidth = UIScreen.main.bounds.size.width
public let screenHeight = UIScreen.main.bounds.size.height
public let statusHeight = iPhonex() ? 44.0 : 20.0
public let navBarHeight = 44.0
public let statusNavHeight = statusHeight + navBarHeight
public let tabbarHeight = iPhonex() ? 49.0 + 34.0 : 49.0
/// 用于大小屏适配
public let scale = screenWidth / 375.0

//MARK: - 圆角
/// 有圆角就不能设置阴影
public func lgViewBorderRadius(view: UIView, radius: CGFloat, width: CGFloat = 0.5, color: UIColor = .clear) {
    view.layer.cornerRadius = radius
    view.layer.masksToBounds = true
    view.layer.borderWidth = width
    view.layer.borderColor = color.cgColor
}
