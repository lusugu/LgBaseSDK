//
//  LGTableViewModel.swift
//  LGKit
//
//  Created by 鲁术光 on 2020/11/25.
//

import UIKit

open class LGTableViewModel: NSObject {
    deinit {
        print("=====================================================================")
        print(" \(NSStringFromClass(self.classForCoder)) deinit")
        print("=====================================================================")
    }
    
    override public init() {
        super.init()
        initialBind()
    }
    
    /// model数据初始化
    open func initialBind() {}
    
    //MARK:  toViewController
    public final func toViewController() -> LGTableViewController {
        let viewModelClassName = String(describing: type(of: self))
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let controllerClassName = clsName + "." + viewModelClassName.replacingOccurrences(of: "Model", with: "Controller")
        if let cls = NSClassFromString(controllerClassName) as? LGTableViewController.Type {
            let vc = cls.init(viewModel: self)
            return vc
        } else {
            assert(false, "无法转换controller")
        }
        return LGTableViewController(viewModel: self)
    }

    //MARK: - attribute
    /// vc的标题
    var title: String = ""
}
