//
//  LGFloat.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

public extension CGFloat {

    //MARK: - 对外方法和属性
    public static var screen: Screen = Screen(width: sw,
                                              height: sh,
                                              rate: sw / 375.0)
    /// safeareaInsets 头部刘海高度
    public static var safe: Safe = Safe(top: sTop,
                                        bottom: sBottom,
                                        left: sLeft,
                                        right: sRight)
    
    //MARK: - 尺寸
    public struct Screen {
        /// 屏幕宽度
        var width: CGFloat
        /// 屏幕高度
        var height: CGFloat
        /// 比例
        var rate: CGFloat
    }
    
    private static var sw: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    private static var sh: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    //MARK: - safe
    public struct Safe {
        /// safeareaInsets 头部刘海高度
        var top: CGFloat
        /// 底部
        var bottom: CGFloat
        /// 左边
        var left: CGFloat
        /// 右边
        var right: CGFloat
    }
    
    private static var sTop: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        } else {
            // Fallback on earlier versions
        }
        return 0
    }
    
    /// safeareaInsets 底部
    private static var sBottom: CGFloat = {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        } else {
            // Fallback on earlier versions
        }
        return 0
    }()

    /// safeareaInsets 左边
    private static var sLeft: CGFloat = {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.left ?? 0
        } else {
            // Fallback on earlier versions
        }
        return 0
    }()

    /// safeareaInsets 右边
    private static var sRight: CGFloat = {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.right ?? 0
        } else {
            // Fallback on earlier versions
        }

        return 0
    }()
}

