//
//  LGExTableView.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2020/12/12.
//

import UIKit

public extension UITableView {

    convenience init(rowHeight: CGFloat = 50,
                     backgroundColor: UIColor = UIColor(rgb: 0xF7F7F7)) {
        self.init()
        
        self.rowHeight = UITableView.automaticDimension
        estimatedRowHeight = rowHeight
        separatorStyle = .none
        self.backgroundColor = backgroundColor
    }
}
