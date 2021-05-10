//
//  LGFloat.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

//MARK: - 屏幕比例
public extension Int {
    var rate: CGFloat {
        return CGFloat(self) * CGFloat.screen.rate
    }
}

//MARK: - 屏幕比例
public extension Double {
    var rate: CGFloat {
        return CGFloat(self) * CGFloat.screen.rate
    }
}

extension CGFloat {
    //MARK: - 对外方法和属性
    /// screen width
    public static var width: CGFloat = screen.width
    /// screen height
    public static var height: CGFloat = screen.height
    /// screen rate
    public static var rate: CGFloat = screen.rate

    /// screen safe top
    public static var safe_top: CGFloat = safe.top
    /// screen safe left
    public static var safe_left: CGFloat = safe.left
    /// screen safe right
    public static var safe_right: CGFloat = safe.right
    /// screen safe bottom
    public static var safe_bottom: CGFloat = safe.bottom
    
    //MARK: - 布局常用
    public static var safeAreaTopHeight: CGFloat = safe.top + 44
    public static var safeAreaBottomHeight: CGFloat = safe.bottom
    public static var safeAreaStateBarHeight: CGFloat = safe.top + 20
    public static var navBtnTop: CGFloat = safe.top

    
    public static var screen: Screen = Screen(width: sw,
                                              height: sh,
                                              rate: sw / 375.0)
    /// safeareaInsets 头部刘海高度
    public static var safe: Safe = Safe(top: sTop,
                                        bottom: sBottom,
                                        left: sLeft,
                                        right: sRight)
        
    private static var sw: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    private static var sh: CGFloat {
        return UIScreen.main.bounds.size.height
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

//MARK: - 尺寸
public struct Screen {
    /// 屏幕宽度
    public var width: CGFloat
    /// 屏幕高度
    public var height: CGFloat
    /// 比例
    public var rate: CGFloat
}

//MARK: - safe
public struct Safe {
    /// safeareaInsets 头部刘海高度
    public var top: CGFloat
    /// 底部
    public var bottom: CGFloat
    /// 左边
    public var left: CGFloat
    /// 右边
    public var right: CGFloat
}
