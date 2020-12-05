//
//  LGSystemInfo.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

fileprivate let phoneDic = ["iPhone10,1": "iPhone 8",
                            "iPhone10,2": "iPhone 8 Plus",
                            "iPhone10,3": "iPhone X",
                            "iPhone10,4": "iPhone 8",
                            "iPhone10,5": "iPhone 8 Plus",
                            "iPhone10,6": "iPhone X",
                            "iPhone11,2": "iPhone XS",
                            "iPhone11,4": "iPhone XS Max (China)",
                            "iPhone11,6": "iPhone XS Max (China)",
                            "iPhone11,8": "iPhone XR",
                            "iPhone12,1": "iPhone 11",
                            "iPhone12,3": "iPhone 11 Pro",
                            "iPhone12,5": "iPhone 11 Pro Max",

                            "iPod1,1": "iPod Touch 1G",
                            "iPod2,1": "iPod Touch 2G",
                            "iPod3,1": "iPod Touch 3G",
                            "iPod4,1": "iPod Touch 4G",
                            "iPod5,1": "iPod Touch (5 Gen)",
                            "iPad1,1": "iPad",
                            "iPad1,2": "iPad 3G",
                            "iPad2,1": "iPad 2 (WiFi)",
                            "iPad2,2": "iPad 2",
                            "iPad2,3": "iPad 2 (CDMA)",
                            "iPad2,4": "iPad 2",
                            "iPad2,5": "iPad Mini (WiFi)",
                            "iPad2,6": "iPad Mini",
                            "iPad2,7": "iPad Mini (GSM+CDMA)",
                            "iPad3,1": "iPad 3 (WiFi)",
                            "iPad3,2": "iPad 3 (GSM+CDMA)",
                            "iPad3,3": "iPad 3",
                            "iPad3,4": "iPad 4 (WiFi)",
                            "iPad3,5": "iPad 4",
                            "iPad3,6": "iPad 4 (GSM+CDMA)",
                            "iPad4,1": "iPad Air (WiFi)",
                            "iPad4,2": "iPad Air (Cellular)",
                            "iPad4,4": "iPad Mini 2 (WiFi)",
                            "iPad4,5": "iPad Mini 2 (Cellular)",
                            "iPad4,6": "iPad Mini 2",
                            "iPad4,7": "iPad Mini 3",
                            "iPad4,8": "iPad Mini 3",
                            "iPad4,9": "iPad Mini 3",
                            "iPad5,1": "iPad Mini 4 (WiFi)",
                            "iPad5,2": "iPad Mini 4 (LTE)",
                            "iPad5,3": "iPad Air 2",
                            "iPad5,4": "iPad Air 2",
                            "iPad6,3": "iPad Pro 9.7",
                            "iPad6,4": "iPad Pro 9.7",
                            "iPad6,7": "iPad Pro 12.9",
                            "iPad6,8": "iPad Pro 12.9",
                            
                            "i386": "Simulator",
                            "x86_64": "Simulator"]

/// 定一个结构体
public struct SystemInfo {
    /// APP版本号
    public static var appVersion: String {
        let infoDictionary = Bundle.main.infoDictionary
        let majorVersion : String? = infoDictionary! ["CFBundleShortVersionString"] as? String//主程序版本号
        return (majorVersion != nil) ? majorVersion! : ""
    }
    
    /// APP构建号
    public static var appBuild: String {
        let infoDictionary = Bundle.main.infoDictionary
        let majorVersion : String? = infoDictionary! ["CFBundleVersion"] as? String//构建号
        return (majorVersion != nil) ? majorVersion! : ""
    }
    
    /// 手机别名
    public static var userPhoneName: String {
        return UIDevice.current.name;
    }
    
    /// 设备名称
    public static var deviceName: String {
        return UIDevice.current.systemName;
    }
    
    /// 手机系统版本号
    public static var systemVersion: String {
        return UIDevice.current.systemVersion;
    }
    
    /// 手机型号
    public static var phoneModel: String {
        return UIDevice.current.model;
    }
    
    /// 地方手机型号
    public static var localPhoneModel: String {
        return UIDevice.current.localizedModel;
    }
}

extension UIDevice {
    /// 设备具体名称
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return phoneDic[identifier] ?? "new device";
    }
}

