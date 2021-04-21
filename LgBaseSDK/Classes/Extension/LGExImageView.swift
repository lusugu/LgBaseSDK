//
//  LGExImageView.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2020/12/18.
//

import UIKit

public extension UIImageView {
    
    /// 图片
    /// - Parameter img: 图片内容
    /// - Returns: 返回图片本体
    @discardableResult
    func image(_ img: UIImage) -> Self {
        image = img
        return self
    }
    
}
