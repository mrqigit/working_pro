//
//  DrawImageCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import UIKit

class DrawImageCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(400)
        }
        imgView.bounds.size.applying(CGAffineTransform(scaleX: UIScreen.main.scale, y: UIScreen.main.scale))
        
        view.addSubview(graphBtn)
        view.addSubview(coreBtn)
        view.addSubview(ioImageBtn)
        view.addSubview(coreImageBtn)
        view.addSubview(vImageBtn)
        
        graphBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
            make.left.right.equalTo(0)
            make.height.equalTo(30)
        }
        coreBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(graphBtn.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(30)
        }
        ioImageBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(coreBtn.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(30)
        }
        coreImageBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ioImageBtn.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(30)
        }
        vImageBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(coreImageBtn.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(30)
        }
    }
    
    lazy var graphBtn: UIButton = {
        return createButton("UIGraphicsImageRenderer", .red, #selector(uiGraphicsImageLoad), self)
    }()
    
    @objc
    func uiGraphicsImageLoad() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let weakSelf = self else {return}
            let image = UIGraphicsImageRendererClass().resizedImage(at: weakSelf.url, for: weakSelf.imgView.bounds.size)
            DispatchQueue.main.sync { [weak weakSelf] in
                guard let _weakSelf = weakSelf else {return}
                UIView.transition(with: _weakSelf.imgView, duration: 1, options: [.curveEaseOut, .transitionCrossDissolve]) {
                    _weakSelf.imgView.image = image
                }
            }
        }
    }
    
    lazy var coreBtn: UIButton = {
        return createButton("Core Graphics Context", .red, #selector(coreGraphicsImageLoad), self)
    }()
    
    @objc
    func coreGraphicsImageLoad() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let weakSelf = self else {return}
            let image = CoreGraphicsContextClass().resizedImage(at: weakSelf.url, for: weakSelf.imgView.bounds.size)
            DispatchQueue.main.sync { [weak weakSelf] in
                guard let _weakSelf = weakSelf else {return}
                UIView.transition(with: _weakSelf.imgView, duration: 1, options: [.curveEaseOut, .transitionCrossDissolve]) {
                    _weakSelf.imgView.image = image
                }
            }
        }
    }
    
    lazy var ioImageBtn: UIButton = {
        return createButton("Image I/O", .red, #selector(iOImageLoad), self)
    }()
    
    @objc
    func iOImageLoad() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let weakSelf = self else {return}
            let image = IOImageClass().resizedImage(at: weakSelf.url, for: weakSelf.imgView.bounds.size)
            DispatchQueue.main.sync { [weak weakSelf] in
                guard let _weakSelf = weakSelf else {return}
                UIView.transition(with: _weakSelf.imgView, duration: 1, options: [.curveEaseOut, .transitionCrossDissolve]) {
                    _weakSelf.imgView.image = image
                }
            }
        }
    }
    
    lazy var coreImageBtn: UIButton = {
        return createButton("Core Image", .red, #selector(coreImageLoad), self)
    }()
    
    @objc
    func coreImageLoad() {
        print(UIScreen.main.scale)
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let weakSelf = self else {return}
            let image = CoreImageClass().resizedImage(at: weakSelf.url, scale: 1, aspectRatio: 1)
            DispatchQueue.main.sync { [weak weakSelf] in
                guard let _weakSelf = weakSelf else {return}
                UIView.transition(with: _weakSelf.imgView, duration: 1, options: [.curveEaseOut, .transitionCrossDissolve]) {
                    _weakSelf.imgView.image = image
                }
            }
        }
    }
    
    lazy var vImageBtn: UIButton = {
        return createButton("vImage", .red, #selector(vImageLoad), self)
    }()
    
    @objc
    func vImageLoad() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let weakSelf = self else {return}
            let image = VImageClass().resizedImage(at: weakSelf.url, for: weakSelf.imgView.bounds.size)
            DispatchQueue.main.sync { [weak weakSelf] in
                guard let _weakSelf = weakSelf else {return}
                UIView.transition(with: _weakSelf.imgView, duration: 1, options: [.curveEaseOut, .transitionCrossDissolve]) {
                    _weakSelf.imgView.image = image
                }
            }
        }
    }
    
    lazy var imgView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var url: URL = {
        return Bundle.main.url(forResource: "VIIRS_3Feb2012_lrg", withExtension: "jpg")!
    }()
}
