//
//  LGExFrame.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/3/10.
//

import Foundation

public extension CGRect {
    static func frame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
        return CGRect(x: x * CGFloat.rate,
                      y: y * CGFloat.rate,
                      width: width * CGFloat.rate,
                      height: height * CGFloat.rate)
    }
}
