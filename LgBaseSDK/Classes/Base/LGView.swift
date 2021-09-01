//
//  LGView.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit
import RxSwift

open class LGView: UIView {

    public let disposedBag: DisposeBag = DisposeBag()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        setUpConstraints()
        viewEvent()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func awakeFromNib() {
       super.awakeFromNib()
    }
}
