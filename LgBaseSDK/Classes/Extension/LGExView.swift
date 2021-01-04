//
//  LGExtensionUIView.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit
import SnapKit

let viewDefault: CGFloat = 9999

@objc extension UIView {
    @objc open func setUpConstraints() {}
    @objc open func setUpViews() {}
    @objc open func viewEvent() {}
}

@objc extension UIViewController {
    @objc open func setUpConstraints() {}
    @objc open func setUpViews() {}
    @objc open func viewEvent() {}
}

public extension UIView {
    
    //MARK : - 最后起作用方法
    /// 最后起作用方法
    func drawConstraints() {
        self.snp.remakeConstraints { (make) in
            if self.sLeft != viewDefault {
                if let tmp = lConstraint {
                    make.left.equalTo(tmp).offset(self.sLeft)
                }
                else {
                    make.left.equalTo(self.sLeft)
                }
            }
            
            if self.sRight != viewDefault {
                if let tmp = rConstraint {
                    make.right.equalTo(tmp).offset(self.sRight)
                }
                else {
                    make.right.equalTo(self.sRight)
                }
            }
            
            if self.sTop != viewDefault {
                if let tmp = tConstraint {
                    make.top.equalTo(tmp).offset(self.sTop)
                }
                else {
                    make.top.equalTo(self.sTop)
                }
            }
            
            if self.sBottom != viewDefault {
                if let tmp = bConstraint {
                    make.bottom.equalTo(tmp).offset(self.sBottom)
                }
                else {
                    make.bottom.equalTo(self.sBottom)
                }
            }
            
            if self.sWidth != viewDefault {
                if let tmp = wConstraint {
                    make.width.equalTo(tmp).offset(self.sWidth)
                }
                else {
                    make.width.equalTo(self.sWidth)
                }
            }
            
            if self.sHeight != viewDefault {
                if let tmp = hConstraint {
                    make.height.equalTo(tmp).offset(self.sHeight)
                }
                else {
                    make.height.equalTo(self.sHeight)
                }
            }
            
            if self.sCenterX != viewDefault {
                if let tmp = sxConstraint {
                    make.centerX.equalTo(tmp).offset(self.sCenterX)
                }
                else {
                    make.centerX.equalTo(self.sCenterX)
                }
            }
            
            if self.sCenterY != viewDefault {
                if let tmp = syConstraint {
                    make.centerY.equalTo(tmp).offset(self.sCenterY)
                }
                else {
                    make.centerY.equalTo(self.sCenterY)
                }
            }
        }
    }
    
    private struct AssociatedKey {
        static var sLeft: CGFloat = viewDefault
        static var sRight: CGFloat = viewDefault
        static var sTop: CGFloat = viewDefault
        static var sBottom: CGFloat = viewDefault
        static var sWidth: CGFloat = viewDefault
        static var sHeight: CGFloat = viewDefault
        static var sCenterX: CGFloat = viewDefault
        static var sCenterY: CGFloat = viewDefault
        static var lConstraint: SnapKit.ConstraintItem?
        static var tConstraint: SnapKit.ConstraintItem?
        static var rConstraint: SnapKit.ConstraintItem?
        static var bConstraint: SnapKit.ConstraintItem?
        static var wConstraint: SnapKit.ConstraintItem?
        static var hConstraint: SnapKit.ConstraintItem?
        static var sxConstraint: SnapKit.ConstraintItem?
        static var syConstraint: SnapKit.ConstraintItem?
    }
    
    //MARK: - 约束属性
    var sLeft: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sLeft) as? CGFloat ?? viewDefault
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sLeft, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var sRight: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sRight) as? CGFloat ?? viewDefault
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sRight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var sTop: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sTop) as? CGFloat ?? viewDefault
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sTop, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var sBottom: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sBottom) as? CGFloat ?? viewDefault
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sBottom, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var sWidth: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sWidth) as? CGFloat ?? viewDefault
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sWidth, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var sHeight: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sHeight) as? CGFloat ?? viewDefault
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sHeight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var sCenterX: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sCenterX) as? CGFloat ?? viewDefault
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sCenterX, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var sCenterY: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sCenterY) as? CGFloat ?? viewDefault
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sCenterY, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    //MARK: - 约束属性 view
    var lConstraint: SnapKit.ConstraintItem? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.lConstraint) as? SnapKit.ConstraintItem
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.lConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var rConstraint: SnapKit.ConstraintItem? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.rConstraint) as? SnapKit.ConstraintItem
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.rConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var tConstraint: SnapKit.ConstraintItem? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.tConstraint) as? SnapKit.ConstraintItem
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.tConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var bConstraint: SnapKit.ConstraintItem? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.bConstraint) as? SnapKit.ConstraintItem
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.bConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var wConstraint: SnapKit.ConstraintItem? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.wConstraint) as? SnapKit.ConstraintItem
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.wConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var hConstraint: SnapKit.ConstraintItem? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.hConstraint) as? SnapKit.ConstraintItem
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.hConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var sxConstraint: SnapKit.ConstraintItem? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.sxConstraint) as? SnapKit.ConstraintItem
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.sxConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var syConstraint: SnapKit.ConstraintItem? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.syConstraint) as? SnapKit.ConstraintItem
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.syConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    //MARK: - 外部 数据添加
    func snpLeft(_ left: CGFloat, constraint: SnapKit.ConstraintItem? = nil) -> Self {
        sLeft = left
        lConstraint = constraint
        return self
    }
    
    func snpRight(_ right: CGFloat, constraint: SnapKit.ConstraintItem? = nil) -> Self {
        sRight = right
        rConstraint = constraint
        return self
    }
    
    func snpTop(_ top: CGFloat, constraint: SnapKit.ConstraintItem? = nil) -> Self {
        sTop = top
        tConstraint = constraint
        return self
    }
    
    func snpBottom(_ bottom: CGFloat, constraint: SnapKit.ConstraintItem? = nil) -> Self {
        sBottom = bottom
        bConstraint = constraint
        return self
    }
    
    func snpWidth(_ width: CGFloat, constraint: SnapKit.ConstraintItem? = nil) -> Self {
        sWidth = width
        wConstraint = constraint
        return self
    }
    
    func snpHeight(_ height: CGFloat, constraint: SnapKit.ConstraintItem? = nil) -> Self {
        sHeight = height
        hConstraint = constraint
        return self
    }
    
    func snpCenterX(_ centerX: CGFloat, constraint: SnapKit.ConstraintItem? = nil) -> Self {
        sCenterX = centerX
        sxConstraint = constraint
        return self
    }
    
    func snpCenterY(_ centerY: CGFloat, constraint: SnapKit.ConstraintItem? = nil) -> Self {
        sCenterY = centerY
        syConstraint = constraint
        return self
    }
    
    /// 背景颜色
    /// - Parameter color: 颜色
    /// - Returns: 返回本身
    @discardableResult
    func lgBackgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
}
