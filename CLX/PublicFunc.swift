//
//  PublicFunc.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import Foundation
import UIKit

func createButton(_ title: String, _ bgColor: UIColor = .red, _ action: Selector, _ target: Any) -> UIButton {
    let button = UIButton(type: .custom)
    button.backgroundColor = bgColor
    button.setTitle(title, for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
    return button
}
