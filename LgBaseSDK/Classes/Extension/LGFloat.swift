//
//  LGFloat.swift
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

public extension Int {
    public var size: CGFloat {
        return CGFloat(self) * CGFloat.screen.rate
    }
}

public extension Double {
    public var size: CGFloat {
        return CGFloat(self) * CGFloat.screen.rate
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
    /// tabbar height
    public var tabbarHeight: CGFloat
    /// 状态栏高度
    public var statusHeight: CGFloat
    /// navBar 高度
    public var navBarHeight: CGFloat
    /// top 高度
    public var statusNavHeight: CGFloat
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
                                              rate: sw / 375.0,
                                              tabbarHeight: tabbarHeight,
                                              statusHeight: statusHeight,
                                              navBarHeight: navBarHeight,
                                              statusNavHeight: statusNavHeight)
    /// safeareaInsets 头部刘海高度
    public static var safe: Safe = Safe(top: sTop,
                                        bottom: sBottom,
                                        left: sLeft,
                                        right: sRight)
    
    private static var tabbarHeight: CGFloat {
        return iPhonex() ? 49.0 + 34.0 : 49.0
    }
    
    private static var statusHeight: CGFloat {
        return iPhonex() ? 44.0 : 20.0
    }
    
    private static var navBarHeight: CGFloat {
        return 44
    }
    
    private static var statusNavHeight: CGFloat {
        return statusHeight + navBarHeight
    }
    
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

