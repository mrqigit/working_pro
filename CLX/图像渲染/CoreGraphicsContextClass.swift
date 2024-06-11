//
//  CoreGraphicsContextClass.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import UIKit

class CoreGraphicsContextClass: NSObject {
    func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
        guard let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil), let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else { return nil }
        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: image.bitsPerComponent, bytesPerRow: image.bytesPerRow, space: image.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: image.bitmapInfo.rawValue)
        context?.interpolationQuality = .high
        context?.draw(image, in: CGRect(origin: .zero, size: size), byTiling: false)
        guard let scaledImage = context?.makeImage() else { return nil }
        return UIImage(cgImage: scaledImage)
    }
}
