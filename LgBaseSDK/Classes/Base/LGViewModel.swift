//
//  LGViewModel.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

open class LGViewModel: NSObject {
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
    public final func toViewController() -> LGViewController {
        let viewModelClassName = String(describing: type(of: self))
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let controllerClassName = clsName + "." + viewModelClassName.replacingOccurrences(of: "Model", with: "Controller")
        if let cls = NSClassFromString(controllerClassName) as? LGViewController.Type {
            let vc = cls.init(viewModel: self)
            return vc
        } else {
            assert(false, "无法转换controller")
        }
        return LGViewController(viewModel: self)
    }

    //MARK: - attribute
    /// vc的标题
    var title: String = ""
}
