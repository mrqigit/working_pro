//
//  UIGraphicsImageRendererClass.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import UIKit

class UIGraphicsImageRendererClass: NSObject {
    
    func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
        guard let image = UIImage(contentsOfFile: url.path) else { return nil }
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
