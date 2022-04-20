//
//  LGTableViewCell.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit
import SnapKit
import RxSwift

public extension UITableViewCell {
    class func withTableView(tableView: UITableView) -> Self {
        let identifier = (String(utf8String: object_getClassName(self))! as NSString).pathExtension
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if let _ = cell {
            return cell! as! Self
        }
        return self.init(style: .default, reuseIdentifier: identifier)
    }
}

open class LGTableViewCell: UITableViewCell {
    
    public let disposedBag: DisposeBag = DisposeBag()
    
    /// 是否需要箭头
    open var isShowArrow: Bool = false {
        didSet {
            self.arrow.isHidden = !isShowArrow
            
            self.arrow.snp.remakeConstraints { (make) in
                make.right.equalTo(-10)
                make.centerY.equalTo(self.childView)
            }
            
            if isShowArrow {
                childView.snp.remakeConstraints { (make) in
                    make.left.top.bottom.equalTo(0)
                    make.right.equalTo(self.arrow.snp.left)
                }
            }
            else {
                childView.snp.remakeConstraints { (make) in
                    make.edges.equalToSuperview()
                }
            }
        }
    }
    
    ///分割线左边距
    open var sepLeftMargin: CGFloat = 0.0 {
        didSet {
            self.sepLine.snp.updateConstraints { make in
                make.left.equalTo(sepLeftMargin)
            }
        }
    }
    
    
    ///分割线右边距
    open var sepRightMargin: CGFloat = 0.0 {
        didSet {
            self.sepLine.snp.updateConstraints { make in
                make.right.equalTo(-sepLeftMargin)
            }
        }
    }
    
    
    ///分割线颜色
    open var sepLineColor:UIColor = UIColor(rgb: 0xE4E4E4) {
        didSet {
            self.sepLine.backgroundColor = sepLineColor
        }
    }
    
    /// 是否需要分割线
    open var isShowSep: Bool = true {
        didSet {
            self.sepLine.isHidden = !isShowSep
        }
    }

    open lazy var childView: UIView = {
        let v = UIView(frame: .zero)
        v.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(v)
        return v
    }()
    
    //MARK: - 私有属性
    /// 箭头
    private lazy var arrow: UIImageView = {
        let bundle = Bundle(path: (Bundle(path: Bundle(for: LGViewController.self).path(forResource: "LgBaseSDK", ofType: "bundle")!)?.path(forResource: "LgBaseSDK", ofType: "bundle"))!)
        let icon = bundle?.path(forResource: "arrow.png", ofType: nil)
        let img = UIImage(contentsOfFile: icon!)
        let image = UIImageView(image: img)
        self.contentView.addSubview(image)
        return image
    }()
    
    /// 分割线
    private lazy var sepLine: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(rgb: 0xD2D2D2, alpha: 0.3)
        self.contentView.addSubview(v)
        return v
    }()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
        viewEvent()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        setUpViews()
        setUpConstraints()
        viewEvent()
    }

    open override func setUpConstraints() {
        super.setUpConstraints()
        
        childView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.sepLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(0.5)
        }
    }
}
