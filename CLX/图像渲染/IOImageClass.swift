//
//  IOImageClass.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import UIKit

class IOImageClass: NSObject {

    func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
        let options:[CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageIfAbsent: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height)
        ]
        
        guard let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil), let image = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary) else { return nil }
        return UIImage(cgImage: image)
    }
}
