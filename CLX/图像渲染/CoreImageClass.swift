//
//  CoreImageClass.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import UIKit

class CoreImageClass: NSObject {
    func resizedImage(at url: URL, scale: CGFloat, aspectRatio: CGFloat) -> UIImage? {
        guard let image = CIImage(contentsOf: url) else { return nil }
        let filter = CIFilter(name: "CILanczosScaleTransform")
        filter?.setValue(image, forKey: kCIInputImageKey)
        filter?.setValue(scale, forKey: kCIInputScaleKey)
        filter?.setValue(aspectRatio, forKey: kCIInputAspectRatioKey)
        
        guard let outputCIImage = filter?.outputImage, let outputCGImage = CIContext(options: [.useSoftwareRenderer: false]).createCGImage(outputCIImage, from: outputCIImage.extent) else { return nil }
        return UIImage(cgImage: outputCGImage)
    }
}
