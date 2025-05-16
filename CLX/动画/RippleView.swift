//
//  RippleView.swift
//  CLX
//
//  Created by MrQi on 2025/4/10.
//

import UIKit

class RippleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .clear
        layer.masksToBounds = false
    }

    func startRippleAnimation() {
        let rippleLayer = CALayer()
        rippleLayer.frame = bounds
        rippleLayer.backgroundColor = UIColor.blue
            .withAlphaComponent(0.5).cgColor
        rippleLayer.cornerRadius = bounds.width / 2
        layer.addSublayer(rippleLayer)

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = NSNumber(value: 0.0)
        scaleAnimation.toValue = NSNumber(value: 1.0)

        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = NSNumber(value: 1.0)
        opacityAnimation.toValue = NSNumber(value: 0.0)

        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [scaleAnimation, opacityAnimation]
        groupAnimation.duration = 2.0
        groupAnimation.repeatCount = .infinity

        rippleLayer.add(groupAnimation, forKey: "rippleAnimation")
    }
}
