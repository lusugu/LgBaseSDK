//
//  LGFont.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

extension UIFont {
    static public func font(_ size: CGFloat) -> UIFont {
        if CGFloat.screen.width <= 375.0 {
            return UIFont.systemFont(ofSize:size)
        }
        return UIFont.systemFont(ofSize:size * CGFloat.screen.rate)
    }
    
    static public func fontBold(_ size: CGFloat) -> UIFont {
        if CGFloat.screen.width <= 375.0 {
            return UIFont.boldSystemFont(ofSize:size)
        }
        return UIFont.boldSystemFont(ofSize:size * CGFloat.screen.rate)
    }
}

