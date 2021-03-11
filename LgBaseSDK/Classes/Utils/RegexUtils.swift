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

/// 密码验证
func regex_password(password: String) -> Bool {
    if password =~ "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$" {
        return true
    }
    return false
}

/// 手机验证
func regex_phone(phone: String) -> Bool {
    if phone =~ "^1[3-9][0-9]{9}$" {
        return true
    }
    return false
}


