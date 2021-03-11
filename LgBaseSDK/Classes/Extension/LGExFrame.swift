//
//  LGExFrame.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/3/10.
//

import Foundation

extension CGRect {
    public static func frame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
        return CGRect(x: x * CGFloat.screen.rate,
                      y: y * CGFloat.screen.rate,
                      width: width * CGFloat.screen.rate,
                      height: height * CGFloat.screen.rate)
    }
}
