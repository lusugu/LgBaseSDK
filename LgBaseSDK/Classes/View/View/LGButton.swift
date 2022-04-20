//
//  LGButton.swift
//  Differentiator
//
//  Created by 鲁术光 on 2020/12/18.
//

import UIKit

public class LGButton: UIControl {

    public enum LGButtonType {
        case top
        case left
        case right
        case bottom
    }
    
    public enum LGButtonAlign {
        case center
        case normal
    }
    
    open var align: LGButtonAlign = .center {
        didSet {
            setUpConstraints()
        }
    }
    
    open var type : LGButtonType = .top {
        didSet {
            setUpConstraints()
        }
    }
    
    open var spacing : CGFloat = 5 {
        didSet {
            setUpConstraints()
        }
    }

    open var titleSize: CGFloat = 14 {
        didSet {
            self.tLabel.font = .font(titleSize)
        }
    }
    
    open var titleBoldSize: CGFloat = 14 {
        didSet {
            self.tLabel.font = .fontBold(titleSize)
        }
    }
    
    open var imgSize: CGSize = .zero {
        didSet {
            setUpConstraints()
        }
    }
    
    private var bgView: UIView!
    private var contentView: UIView!
    private var tLabel: UILabel!
    private var iImageView: UIImageView!
    private var bgImageView: UIImageView!

    //MARK: - 属性 - 状态 集合
    private var textDic: [UIControl.State.RawValue: String] = [:]
    private var textColorDic: [UIControl.State.RawValue: UIColor] = [:]
    private var imageDic: [UIControl.State.RawValue: UIImage] = [:]
    private var backgroundImageDic: [UIControl.State.RawValue: UIImage] = [:]
    
    public init(type: LGButtonType = .top) {
        super.init(frame: .zero)
        
        self.type = type
        
        setUpViews()
        setUpConstraints()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func awakeFromNib() {
       super.awakeFromNib()
        
        setUpViews()
        setUpConstraints()
        viewEvent()
    }
    
    public override func setUpViews() {
        super.setUpViews()
        
        bgView = UIView()
        bgView.isUserInteractionEnabled = false
        addSubview(bgView)
        
        contentView = UIView()
        addSubview(contentView)
        
        bgImageView = UIImageView()
        bgView.addSubview(bgImageView)
        
        tLabel = UILabel()
            .setFont(.font(titleSize))
        contentView.addSubview(tLabel)
        
        iImageView = UIImageView()
        contentView.addSubview(iImageView)
        
        bgView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        bgImageView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        contentView.snp.remakeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    //MARK: - 属性 - 状态 集合
    /// 设置文字
    /// - Parameters:
    ///   - title: 文字内容
    ///   - state: 状态
    open func setTitle(title: String, state: UIControl.State) {
        textDic.updateValue(title, forKey: state.rawValue)
        self.setNeedsDisplay()
    }
    
    /// 设置字体颜色
    /// - Parameters:
    ///   - color: 字体颜色
    ///   - state: 状态
    open func setTitleColor(color: UIColor, state: UIControl.State) {
        textColorDic.updateValue(color, forKey: state.rawValue)
        self.setNeedsDisplay()
    }
    
    /// 设置背景颜色
    /// - Parameters:
    ///   - color: 背景颜色
    ///   - state: 状态
    open func setBackgroundImage(image: UIImage?, state: UIControl.State) {
        if let img = image {
            backgroundImageDic.updateValue(img, forKey: state.rawValue)
            self.setNeedsDisplay()
        }
    }
    
    /// 设置背景颜色
    /// - Parameters:
    ///   - color: 背景颜色
    ///   - state: 状态
    open func setImage(image: UIImage?, state: UIControl.State) {
        if let img = image {
            imageDic.updateValue(img, forKey: state.rawValue)
            self.setNeedsDisplay()
        }
    }
    
    open func setContentViewColor(color: UIColor) {
        contentView.backgroundColor = color
        self.setNeedsDisplay()
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let value = textDic[state.rawValue] {
            tLabel.text = value
        }
        
        if let value = textColorDic[state.rawValue] {
            tLabel.textColor = value
        }
        
        if let value = imageDic[state.rawValue] {
            iImageView.image = value
        }
        
        if let value = backgroundImageDic[state.rawValue] {
            bgImageView.image = value
        }
    }
    
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.bounds.contains(point) {
            return self
        }
        return nil
    }
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if self.bounds.contains(point) {
            return true
        }
        return false
    }
}

extension LGButton {
    
    public override func setUpConstraints() {
        super.setUpConstraints()
        
        switch type {
        case .bottom:
            bottomConstraints()
            break
        case .left:
            leftConstraints()
            break
        case .right:
            rightConstraints()
            break
        default:
            topConstraints()
        }
    }
    
    func rightConstraints() {
        if align == .center {
            iImageView.snp.remakeConstraints { (make) in
                make.centerY.equalTo(contentView)
                make.left.equalTo(tLabel.snp.right).offset(spacing)
                make.right.equalTo(0)
                if imgSize != .zero {
                    make.width.equalTo(imgSize.width)
                    make.height.equalTo(imgSize.height)
                }
            }
            
            tLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(0)
                make.centerY.equalTo(contentView)
            }
        }
        else {
            contentView.snp.remakeConstraints { make in
                make.edges.equalTo(0)
            }
            iImageView.snp.remakeConstraints { (make) in
                make.centerY.equalTo(contentView)
                make.left.equalTo(tLabel.snp.right).offset(spacing)
                make.right.equalTo(0)
                if imgSize != .zero {
                    make.width.equalTo(imgSize.width)
                    make.height.equalTo(imgSize.height)
                }
            }
            
            tLabel.snp.remakeConstraints { (make) in
                make.centerY.equalTo(contentView)
            }
        }
    }
    
    func leftConstraints() {
        if align == .center {
            iImageView.snp.remakeConstraints { (make) in
                make.centerY.equalTo(contentView)
                make.left.equalTo(0)
                if imgSize != .zero {
                    make.width.equalTo(imgSize.width)
                    make.height.equalTo(imgSize.height)
                }
            }
            
            tLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(iImageView.snp.right).offset(spacing)
                make.centerY.equalTo(contentView)
                make.right.equalTo(0)
            }
        }
        else {
            contentView.snp.remakeConstraints { make in
                make.edges.equalTo(0)
            }
            iImageView.snp.remakeConstraints { (make) in
                make.centerY.equalTo(contentView)
                make.left.equalTo(10)
                if imgSize != .zero {
                    make.width.equalTo(imgSize.width)
                    make.height.equalTo(imgSize.height)
                }
            }
            
            tLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(iImageView.snp.right).offset(spacing)
                make.centerY.equalTo(iImageView)
            }
        }
    }
    
    func bottomConstraints() {
        if align == .center {
            iImageView.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self)
                make.top.equalTo(tLabel.snp.bottom).offset(spacing)
                make.bottom.equalTo(0)
                if imgSize != .zero {
                    make.width.equalTo(imgSize.width)
                    make.height.equalTo(imgSize.height)
                }
            }
            
            tLabel.snp.remakeConstraints { (make) in
                make.top.equalTo(0)
                make.centerX.equalTo(self)
            }
        }
        else {
            contentView.snp.remakeConstraints { make in
                make.edges.equalTo(0)
            }
            
            iImageView.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self)
                make.top.equalTo(tLabel.snp.bottom).offset(spacing)
                make.bottom.equalTo(0)
                if imgSize != .zero {
                    make.width.equalTo(imgSize.width)
                    make.height.equalTo(imgSize.height)
                }
            }
            
            tLabel.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self)
            }
        }
    }
    
    func topConstraints() {
        if align == .center {
            iImageView.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self)
                make.bottom.equalTo(tLabel.snp.top).offset(-spacing)
                make.top.equalTo(0)
                if imgSize != .zero {
                    make.width.equalTo(imgSize.width)
                    make.height.equalTo(imgSize.height)
                }
            }
            
            tLabel.snp.remakeConstraints { (make) in
                make.bottom.equalTo(0)
                make.centerX.equalTo(self)
            }
        }
        else {
            contentView.snp.remakeConstraints { make in
                make.edges.equalTo(0)
            }
            
            iImageView.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self)
                make.bottom.equalTo(tLabel.snp.top).offset(-spacing)
                make.top.equalTo(0)
                if imgSize != .zero {
                    make.width.equalTo(imgSize.width)
                    make.height.equalTo(imgSize.height)
                }
            }
            
            tLabel.snp.remakeConstraints { (make) in
                make.centerX.equalTo(self)
            }
        }
    }
}
