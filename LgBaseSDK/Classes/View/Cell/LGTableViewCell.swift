//
//  LGTableViewCell.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit
import SnapKit

public extension UITableViewCell {
    class func withTableView(tableView: UITableView) -> Self {
        let identifier = String(utf8String: object_getClassName(self))
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier!)
        if let _ = cell {
            return cell! as! Self
        }
        return self.init(style: .default, reuseIdentifier: identifier)
    }
}

open class LGTableViewCell: UITableViewCell {
    
    /// 是否需要箭头
    public var isShowArrow: Bool = false {
        didSet {
            self.arrow.isHidden = !isShowSep
            
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
        }
    }
    
    /// 是否需要分割线
    public var isShowSep: Bool = true {
        didSet {
            self.sepLine.isHidden = !isShowSep
        }
    }

    public lazy var childView: UIView = {
        let v = UIView(frame: .zero)
        v.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(v)
        return v
    }()
    
    //MARK: - 私有属性
    /// 箭头
    private lazy var arrow: UIImageView = {
        let bundle = Bundle(path: (Bundle(path: Bundle(for: LGViewController.classForCoder()).path(forResource: "LGKit", ofType: "bundle")!)?.path(forResource: "LGKit", ofType: "bundle"))!)       
        let icon = bundle?.path(forResource: "arrow.png", ofType: nil)
        let img = UIImage(contentsOfFile: icon!)
        let image = UIImageView(image: img)
        self.contentView.addSubview(image)
        return image
    }()
    
    /// 分割线
    private lazy var sepLine: UIView = {
        let v = UIView()
        if #available(iOS 13.0, *) {
            v.backgroundColor = .separator
        } else {
            // Fallback on earlier versions
            v.backgroundColor = UIColor(rgb: 0xE4E4E4)
        }
        self.contentView.addSubview(v)
        return v
    }()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraints()
        viewEvent()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        setUpConstraints()
        viewEvent()
    }

    public override func setUpConstraints() {
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
