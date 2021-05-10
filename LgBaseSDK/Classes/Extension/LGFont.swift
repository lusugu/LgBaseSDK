//
//  LGFont.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

public extension UIFont {
    static func font(_ size: CGFloat) -> UIFont {
        if CGFloat.width <= 375.0 {
            return UIFont.systemFont(ofSize:size)
        }
        return UIFont.systemFont(ofSize:size * CGFloat.rate)
    }
    
    static func fontBold(_ size: CGFloat) -> UIFont {
        if CGFloat.width <= 375.0 {
            return UIFont.boldSystemFont(ofSize:size)
        }
        return UIFont.boldSystemFont(ofSize:size * CGFloat.rate)
    }
}

