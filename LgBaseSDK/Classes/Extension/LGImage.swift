//
//  LGImage.swift
//  LGModule
//
//  Created by 鲁术光 on 2020/11/19.
//

import UIKit

public extension UIImage {
    //MARK: - 创建一个颜色的图片UIImage
    /// 创建一个纯颜色的图片UIImage
    /// - Parameters:
    ///   - rgb: 颜色色值
    ///   - size: 图片大小
    /// - Returns: 图片对象
    class func image(rgb: UInt32, size: CGSize = CGSize(width: 10, height: 10)) -> UIImage? {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        let co = UIColor(rgb: rgb)
        UIGraphicsBeginImageContext(size)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(co.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
    
    /// 创建一个纯颜色的图片UIImage
    /// - Parameters:
    ///   - rgb: 颜色对象
    ///   - size: 图片大小
    /// - Returns: 图片对象
    class func image(color: UIColor, size: CGSize = CGSize(width: 10, height: 10)) -> UIImage? {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContext(size)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
    
    //MARK: -传进去字符串,生成二维码图片
    /// 传进去字符串,生成二维码图片
    /// - Parameters:
    ///   - text: 字符串
    ///   - image: 图片
    /// - Returns: 返回一个二维码图片
    static func setupQRCodeImage(_ text: String, image: UIImage?) -> UIImage {
        //创建滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        //将url加入二维码
        filter?.setValue(text.data(using: String.Encoding.utf8), forKey: "inputMessage")
        //取出生成的二维码（不清晰）
        if let outputImage = filter?.outputImage {
            //生成清晰度更好的二维码
            let qrCodeImage = setupHighDefinitionUIImage(outputImage, size: 600)
            return qrCodeImage
        }
        
        return UIImage()
    }
    
    //MARK: - 生成高清的UIImage
    static func setupHighDefinitionUIImage(_ image: CIImage, size: CGFloat) -> UIImage {
        let integral: CGRect = image.extent.integral
        let proportion: CGFloat = min(size/integral.width, size/integral.height)
        
        let width = integral.width * proportion
        let height = integral.height * proportion
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapRef = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 0)!
        
        let context = CIContext(options: nil)
        let bitmapImage: CGImage = context.createCGImage(image, from: integral)!
        
        bitmapRef.interpolationQuality = CGInterpolationQuality.none
        bitmapRef.scaleBy(x: proportion, y: proportion);
        bitmapRef.draw(bitmapImage, in: integral);
        let image: CGImage = bitmapRef.makeImage()!
        return UIImage(cgImage: image)
    }
}

