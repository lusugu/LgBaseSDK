//
//  LGViewController.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit
import RxSwift
import JXSegmentedView

open class LGDeployData {
    public var titleColor: UIColor = .black
    public var navBackgroundColor: UIColor = .white
    public var backImg: UIImage?
    
    /// 单例
    public class var shared: LGDeployData {
        struct Static {
            static let instance = LGDeployData()
        }
        return Static.instance
    }
}

open class LGViewController: UIViewController {
    
    public let disposedBag: DisposeBag = DisposeBag()
    
//    //MARK: - 初始化方法
//    public required init(viewModel: LGViewModel) {
//        super.init(nibName: nil, bundle: nil)
//        self.baseViewModel = viewModel
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    //MARK: -
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        
        setUpNav()
        
        // 在自定义leftBarButtonItem后添加下面代码就可以完美解决返回手势无效的情况
        guard let nav = navigationController else {
            return
        }
                
        nav.interactivePopGestureRecognizer?.delegate = nil
        let gestureArray = nav.view.gestureRecognizers ?? []
        //当是侧滑手势的时候设置scrollview需要此手势失效才生效即可
        for gesture in gestureArray {
            if gesture.isKind(of: UIScreenEdgePanGestureRecognizer.classForCoder()) {
                for sub in view.subviews {
                    if sub.isKind(of: UIScrollView.classForCoder()) {
                        let sc: UIScrollView = sub as! UIScrollView
                        sc.panGestureRecognizer.require(toFail: gesture)
                    }
                }
            }
        }
        
        setUpViews()
        setUpConstraints()
        viewEvent()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("=====================================================================")
        print(" \(Self.self) viewWillAppear ")
        print("=====================================================================")
    }
    
    //MARK: - attribute
    var baseViewModel: LGViewModel!
    
    //MARK: - 属性
    lazy var navLeftBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: CGFloat.safe_top, width: CGFloat.width / 4, height: 44))
        btn.addTarget(self, action: #selector(leftEvent), for: .touchUpInside)
        
        if let img = LGDeployData.shared.backImg {
            btn.setImage(img)
        }
        else {
            let bundle = Bundle(path: (Bundle(path: Bundle(for: LGViewController.self).path(forResource: "LgBaseSDK", ofType: "bundle")!)?.path(forResource: "LgBaseSDK", ofType: "bundle"))!)
            let icon = bundle?.path(forResource: "back.png", ofType: nil)
            let img = UIImage(contentsOfFile: icon!)
            btn.setImage(img!)
        }
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        btn.titleLabel?.font = .font(15)
        navBarView.addSubview(btn)
        btn.contentHorizontalAlignment = .left
        btn.isHidden = true
        return btn
    }()
    lazy var navRightBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: CGFloat.width - CGFloat.width / 4, y: CGFloat.safe_top, width: CGFloat.width / 4, height: 44))
        btn.addTarget(self, action: #selector(rightEvent), for: .touchUpInside)
        btn.isHidden = true
        btn.contentHorizontalAlignment = .right
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        btn.titleLabel?.font = .font(15)
        navBarView.addSubview(btn)
        return btn
    }()
    public lazy var navBarView: UIView = {
        let navBarView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat.width, height: CGFloat.safeAreaTopHeight))
        navBarView.backgroundColor = LGDeployData.shared.navBackgroundColor
        view.addSubview(navBarView)
        return navBarView
    }()
    lazy var navShadowLine: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: CGFloat.safeAreaTopHeight - 0.5, width: CGFloat.width, height: 0.5))
        if #available(iOS 13.0, *) {
            v.backgroundColor = .systemGray5
        } else {
            // Fallback on earlier versions
            v.backgroundColor = UIColor(red: 237 / 255.0, green: 239 / 255.0, blue: 242 / 255.0, alpha: 1)
        }
        navBarView.addSubview(v)
        return v
    }()
    lazy var headTitleLabel: UILabel = {
        let l = UILabel(frame: CGRect(x: CGFloat.width / 4, y: CGFloat.safe_top, width: CGFloat.width / 2, height: 44))
        l.textColor = LGDeployData.shared.titleColor
        l.font = .font(18)
        l.textAlignment = .center
        navBarView.addSubview(l)
        return l
    }()
    public var currentStatusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    //MARK: - nav
    @objc open func leftEvent() {
        self.navigationController?.popViewController(animated: true)
        if self == self.navigationController?.viewControllers.first {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc open func rightEvent() {
        
    }
    
    public override var title: String? {
        didSet {
            self.headTitleLabel.text = title
        }
    }
    
    public var titleColor: UIColor = .black {
        didSet {
            headTitleLabel.textColor = titleColor
        }
    }
    
    public var navBarBackgroundColor: UIColor = .white {
        didSet {
            navBarView.backgroundColor = navBarBackgroundColor
        }
    }
    
    /// 是否隐藏nav line
    public var navBottomViewLineHidden: Bool = false {
        didSet {
            navShadowLine.isHidden = navBottomViewLineHidden
        }
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.currentStatusBarStyle
    }
    
    /// 是否隐藏nav
    public var navBarHidden: Bool = false {
        didSet {
            navBarView.isHidden = navBarHidden
        }
    }
}

//MARK: - util
extension LGViewController {
    /// 计算字符串的长度
    func calculateWidth(string: String, font: UIFont) -> CGFloat {
        let attributeDic = [NSAttributedString.Key.font: font]
        let size = (string as NSString).boundingRect(with: CGSize(width: Double(MAXFLOAT), height: 44.0), options: [.usesLineFragmentOrigin, .usesFontLeading, .truncatesLastVisibleLine], attributes: attributeDic, context: nil).size
        return size.width + 20
    }
    
}

//MARK: - NAV BAR
public extension LGViewController {
    
    func setUpNav() {
        // 如果不是nav的第一个视图控制器,则添加返回按钮
        if let childs = self.navigationController?.viewControllers {
            if self != childs[0] {
                navLeftBtn.isHidden = false
            }
        }
        
    }
    
    //MARK: - 左边按钮
    func setLeftBtn(_ title: String = "",
                    textColor: UIColor = .black,
                    image: UIImage,
                    state: UIControl.State = .normal) {
        navLeftBtn.setTitle(title, for: state)
        navLeftBtn.setTitleColor(textColor, for: state)
        navLeftBtn.setImage(image, for: state)
        navLeftBtn.isHidden = false
    }
    
    //MARK: - 右边按钮
    func setRightBtn(_ title: String = "",
                    textColor: UIColor = .black,
                    image: UIImage,
                    state: UIControl.State = .normal) {
        navRightBtn.setTitle(title, for: state)
        navRightBtn.setTitleColor(textColor, for: state)
        navRightBtn.setImage(image, for: state)
        navRightBtn.isHidden = false
    }
}

extension LGViewController : JXSegmentedListContainerViewListDelegate {
    public func listView() -> UIView {
        return view
    }
}
