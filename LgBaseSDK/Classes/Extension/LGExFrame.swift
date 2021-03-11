//
//  LGExFrame.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/3/10.
//

import Foundation

extension CGRect {
    public static func frame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
        return CGRect(x: x * scale, y: y * scale, width: width * scale, height: height * scale)
    }
}
