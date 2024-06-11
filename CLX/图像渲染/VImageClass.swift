//
//  VImageClass.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import UIKit
import Accelerate.vImage

class VImageClass: NSObject {
    func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
        guard let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil), let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil), let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as? [CFString: Any], let imageWidth = properties[kCGImagePropertyPixelWidth] as? vImagePixelCount,let imageHeight = properties[kCGImagePropertyPixelHeight] as? vImagePixelCount else { return nil }
        var format = vImage_CGImageFormat(bitsPerComponent: 8, bitsPerPixel: 32, colorSpace: nil, bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.first.rawValue), version: 0, decode: nil, renderingIntent: .defaultIntent)
        var error: vImage_Error
        
        /// 创建缓冲区
        var sourceBuffer = vImage_Buffer()
        defer {
            sourceBuffer.data.deallocate()
        }
        error = vImageBuffer_InitWithCGImage(&sourceBuffer, &format, nil, image, vImage_Flags(kvImageNoFlags))
        guard error == kvImageNoError else {
            return nil
        }
        
        // 初始化目标缓冲区
        var destinationBuffer = vImage_Buffer()
        error = vImageBuffer_Init(&destinationBuffer, vImagePixelCount(size.height), vImagePixelCount(size.width), format.bitsPerPixel, vImage_Flags(kvImageNoFlags))
        guard error == kvImageNoError else {
            return nil
        }
        // 优化缩放图像
        error = vImageScale_ARGB8888(&sourceBuffer, &destinationBuffer, nil, vImage_Flags(kvImageHighQualityResampling))
        
        guard error == kvImageNoError else {
            return nil
        }
        
        // 从缓冲区创建一个CGImage对象
        guard let resizedImage = vImageCreateCGImageFromBuffer(&destinationBuffer, &format, nil, nil, vImage_Flags(kvImageNoAllocate), &error)?.takeRetainedValue(), error == kvImageNoError else {
            return nil
        }
        
        return UIImage(cgImage: resizedImage)
    }
}
