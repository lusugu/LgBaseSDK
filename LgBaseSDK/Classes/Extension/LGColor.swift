//
//  LGColor.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

public extension UIColor {
    /// assets 颜色处理 适配暗黑模式常用
    /// - Parameters:
    ///   - name: color在assets中的名字
    ///   - rgb: 11.0以下使用默认颜色
    convenience init?(name: String, rgb: UInt32) {
        if #available(iOS 11.0, *) {
            self.init(named: name)
        } else {
            self.init(rgb: rgb)
        }
    }
    
    /// 扩展一个颜色的初始化方法
    /// - Parameter rgb: 十六进制颜色
    convenience init(rgb: UInt32) {
        let red = CGFloat(Float(((rgb>>16) & 0xFF)) / 255.0)
        let green = CGFloat(Float(((rgb>>8) & 0xFF)) / 255.0)
        let blue = CGFloat(Float(((rgb>>0) & 0xFF)) / 255.0)
        let alpha = CGFloat(1)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// 扩展一个颜色的初始化方法
    /// - Parameters:
    ///   - rgb: 十六进制颜色
    ///   - alpha: 透明度
    convenience init(rgb: UInt32, alpha: CGFloat) {
        let red = CGFloat(Float(((rgb>>16) & 0xFF)) / 255.0)
        let green = CGFloat(Float(((rgb>>8) & 0xFF)) / 255.0)
        let blue = CGFloat(Float(((rgb>>0) & 0xFF)) / 255.0)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
