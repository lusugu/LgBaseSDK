//
//  RegexUtils.swift
//  LgBaseSDK
//
//  Created by 鲁术光 on 2021/2/28.
//

import Foundation

/// 邮箱验证
func regex_email(email: String) -> Bool {
    if email =~ "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$" {
        return true
    }
    return false
}


