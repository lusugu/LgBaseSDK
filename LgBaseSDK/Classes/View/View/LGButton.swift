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
    
    open var type : LGButtonType = .top {
        didSet {
            setUpConstraints()
        }
    }

    open var titleSize: CGFloat = 14 {
        didSet {
            self.tLabel.font = .font(titleSize)
        }
    }
    
    private var tLabel: UILabel!
    private var iImageView: UIImageView!
    
    //MARK: - 属性 - 状态 集合
    private var textDic: [UIControl.State.RawValue: String] = [:]
    private var textColorDic: [UIControl.State.RawValue: UIColor] = [:]
    private var imageDic: [UIControl.State.RawValue: UIImage] = [:]
    private var backgroundColorDic: [UIControl.State.RawValue: UIColor] = [:]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }
    
    public init(type: LGButtonType = .top) {
        super.init(frame: .zero)
        
        self.type = type
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        tLabel = UILabel()
            .setFont(.font(titleSize))
        addSubview(tLabel)
        
        iImageView = UIImageView()
        addSubview(iImageView)
    }
    
    //MARK: - 属性 - 状态 集合
    /// 设置文字
    /// - Parameters:
    ///   - title: 文字内容
    ///   - state: 状态
    open func setTitle(title: String, state: UIControl.State) {
        textDic.updateValue(title, forKey: state.rawValue)
    }
    
    /// 设置字体颜色
    /// - Parameters:
    ///   - color: 字体颜色
    ///   - state: 状态
    open func setTitleColor(color: UIColor, state: UIControl.State) {
        textColorDic.updateValue(color, forKey: state.rawValue)
    }
    
    /// 设置背景颜色
    /// - Parameters:
    ///   - color: 背景颜色
    ///   - state: 状态
    open func setBackgroundColor(color: UIColor, state: UIControl.State) {
        backgroundColorDic.updateValue(color, forKey: state.rawValue)
    }
    
    /// 设置背景颜色
    /// - Parameters:
    ///   - color: 背景颜色
    ///   - state: 状态
    open func setImageColor(image: UIImage?, state: UIControl.State) {
        if let img = image {
            imageDic.updateValue(img, forKey: state.rawValue)
        }
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
        
        if let value = backgroundColorDic[state.rawValue] {
            backgroundColor = value
        }
    }
}

extension LGButton {
    public override func setUpConstraints() {
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
        iImageView.snp.remakeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(tLabel.snp.right).offset(5)
        }
        
        tLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(0)
            make.centerY.equalTo(self)
        }
    }
    
    func leftConstraints() {
        iImageView.snp.remakeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(0)
        }
        
        tLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(iImageView.snp.right).offset(5)
            make.centerY.equalTo(self)
        }
    }
    
    func bottomConstraints() {
        iImageView.snp.remakeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(tLabel.snp.bottom).offset(5)
        }
        
        tLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(0)
            make.centerX.equalTo(self)
        }
    }
    
    func topConstraints() {
        iImageView.snp.remakeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(tLabel.snp.top).offset(-5)
        }
        
        tLabel.snp.remakeConstraints { (make) in
            make.bottom.equalTo(0)
            make.centerX.equalTo(self)
        }
    }
}
