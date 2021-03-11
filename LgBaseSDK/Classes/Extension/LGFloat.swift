//
//  LGFloat.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

extension Int {
    public var size: CGFloat {
        return CGFloat(self) * scale
    }
}

extension Double {
    public var size: CGFloat {
        return CGFloat(self) * scale
    }
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

extension CGFloat {
    //MARK: - 对外方法和属性
    public static var screen: Screen = Screen(width: sw,
                                              height: sh,
                                              rate: scale)
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

