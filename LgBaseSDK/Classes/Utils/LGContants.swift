//
//  LGContants.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

let jm_isPhone = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
let isPhone_4_or_Less = jm_isPhone && CGFloat.screen.height < 568.0
let isPhone_5 = jm_isPhone && CGFloat.screen.height == 568.0
let isPhone_6 = jm_isPhone && CGFloat.screen.height == 667.0

//MARK: - 圆角
/// 有圆角就不能设置阴影
public func viewBorderRadius(view: UIView, radius: CGFloat, width: CGFloat = 0.5, color: UIColor = .clear) {
    view.layer.cornerRadius = radius
    view.layer.masksToBounds = true
    view.layer.borderWidth = width
    view.layer.borderColor = color.cgColor
}
