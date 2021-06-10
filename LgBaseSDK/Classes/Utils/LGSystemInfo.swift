//
//  LGSystemInfo.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

fileprivate let phoneDic = ["i386"      : "Simulator",
                             "x86_64"    : "Simulator",
                             
                             "iPhone5,1" : "iPhone 5",          // (model A1428, AT&T/Canada)
                             "iPhone5,2" : "iPhone 5",          // (model A1429, everything else)
                             "iPhone5,3" : "iPhone 5c",         // (model A1456, A1532 | GSM)
                             "iPhone5,4" : "iPhone 5c",         // (model A1507, A1516, A1526 (China), A1529 | Global)
                             "iPhone6,1" : "iPhone 5s",         // (model A1433, A1533 | GSM)
                             "iPhone6,2" : "iPhone 5s",         // (model A1457, A1518, A1528 (China), A1530 | Global)
                             "iPhone7,1" : "iPhone 6 Plus",     //
                             "iPhone7,2" : "iPhone 6",          //
                             "iPhone8,1" : "iPhone 6S",         //
                             "iPhone8,2" : "iPhone 6S Plus",    //
                             "iPhone8,4" : "iPhone SE",         //
                             "iPhone9,1" : "iPhone 7",          //
                             "iPhone9,3" : "iPhone 7",          //
                             "iPhone9,2" : "iPhone 7 Plus",     //
                             "iPhone9,4" : "iPhone 7 Plus",     //
                             "iPhone10,1": "iPhone 8",          // CDMA
                             "iPhone10,4": "iPhone 8",          // GSM
                             "iPhone10,2": "iPhone 8 Plus",     // CDMA
                             "iPhone10,5": "iPhone 8 Plus",     // GSM
                             "iPhone10,3": "iPhone X",          // CDMA
                             "iPhone10,6": "iPhone X",          // GSM
                             "iPhone11,2": "iPhone XS",         //
                             "iPhone11,4": "iPhone XS Max",     //
                             "iPhone11,6": "iPhone XS Max",     // China
                             "iPhone11,8": "iPhone XR",         //
                             "iPhone12,1": "iPhone 11",         //
                             "iPhone12,3": "iPhone 11 Pro",     //
                             "iPhone12,5": "iPhone 11 Pro Max", //
                             "iPhone12,8": "iPhone SE2", //
                             "iPhone13,1": "iPhone 12 mini", //
                             "iPhone13,2": "iPhone 12", //
                             "iPhone13,3": "iPhone 12 Pro", //
                             "iPhone13,4": "iPhone 12 Pro Max", //
                             
                             /// iPad Air
                             "iPad4,1"   : "iPad Air",
                             "iPad4,2"   : "iPad Air",
                             "iPad4,3"   : "iPad Air",
                             "iPad5,3"   : "iPad Air 2",
                             "iPad5,4"   : "iPad Air 2",
                             "iPad11,3"   : "iPad Air (3rd generation)",
                             "iPad11,4"   : "iPad Air (3rd generation)",
                             "iPad13,1"   : "iPad Air (4th generation)",
                             "iPad13,2"   : "iPad Air (4th generation)",
                             
                             /// iPad Pro
                             "iPad6,7"   : "iPad Pro (12.9-inch)",
                             "iPad6,8"   : "iPad Pro (12.9-inch)",
                             "iPad6,3"   : "iPad Pro (9.7-inch)",
                             "iPad6,4"   : "iPad Pro (9.7-inch)",
                             "iPad7,1"   : "iPad Pro (12.9-inch) (2nd generation)",
                             "iPad7,2"   : "iPad Pro (12.9-inch) (2nd generation)",
                             "iPad7,3"   : "iPad Pro (10.5-inch)",
                             "iPad7,4"   : "iPad Pro (10.5-inch)",
                             "iPad8,1"   : "iPad Pro (11-inch)",
                             "iPad8,2"   : "iPad Pro (11-inch)",
                             "iPad8,3"   : "iPad Pro (11-inch)",
                             "iPad8,4"   : "iPad Pro (11-inch)",
                             "iPad8,5"   : "iPad Pro (12.9-inch) (3rd generation)",
                             "iPad8,6"   : "iPad Pro (12.9-inch) (3rd generation)",
                             "iPad8,7"   : "iPad Pro (12.9-inch) (3rd generation)",
                             "iPad8,8"   : "iPad Pro (12.9-inch) (3rd generation)",
                             "iPad8,9"   : "iPad Pro (11-inch) (2nd generation)",
                             "iPad8,10"   : "iPad Pro (11-inch) (2nd generation)",
                             "iPad8,11"   : "iPad Pro (12.9-inch) (4th generation)",
                             "iPad8,12"   : "iPad Pro (12.9-inch) (4th generation)",
                             "iPad13,4"   : "iPad Pro (11-inch) (3rd generation)",
                             "iPad13,5"   : "iPad Pro (11-inch) (3rd generation)",
                             "iPad13,6"   : "iPad Pro (11-inch) (3rd generation)",
                             "iPad13,7"   : "iPad Pro (11-inch) (3rd generation)",
                             "iPad13,8"   : "iPad Pro (12.9-inch) (5th generation)",
                             "iPad13,9"   : "iPad Pro (12.9-inch) (5th generation)",
                             "iPad13,10"   : "iPad Pro (12.9-inch) (5th generation)",
                             "iPad13,11"   : "iPad Pro (12.9-inch) (5th generation)",
                             /// iPad mini
                             "iPad2,5"   : "iPad mini",
                             "iPad2,6"   : "iPad mini",
                             "iPad2,7"   : "iPad mini",
                             "iPad4,4"   : "iPad mini 2",
                             "iPad4,5"   : "iPad mini 2",
                             "iPad4,6"   : "iPad mini 2",
                             "iPad4,7"   : "iPad mini 3",
                             "iPad4,8"   : "iPad mini 3",
                             "iPad4,9"   : "iPad mini 3",
                             "iPad5,1"   : "iPad mini 4",
                             "iPad5,2"   : "iPad mini 4",
                             "iPad11,1"   : "iPad mini (5th generation)",
                             "iPad11,2"   : "iPad mini (5th generation)",
                             
                             /// iPod touch
                             "iPod9,1" : "iPod touch (7th generation)",
                             "iPod7,1" : "iPod touch (6th generation)",
                             "iPod5,1" : "iPod touch (5th generation)",
                             "iPod4,1" : "iPod touch (4th generation)",
                             "iPod3,1" : "iPod touch (3rd generation)",
                             "iPod2,1" : "iPod touch (2nd generation)",
                             "iPod1,1" : "iPod touch"]

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

