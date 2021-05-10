//
//  LGExImageView.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2020/12/18.
//

import UIKit

public extension UIImageView {
    
    convenience init(image: UIImage) {
        self.init()
        
        setImage(image)
    }
    
    /// 图片
    /// - Parameter img: 图片内容
    /// - Returns: 返回图片本体
    @discardableResult
    func setImage(_ image: UIImage) -> Self {
        self.image = image
        return self
    }
    
}
