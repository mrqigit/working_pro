//
//  AttributeStringCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import UIKit

class AttributeStringCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.bottom.left.right.top.equalTo(0)
        }
        
        let username = "AliGator"
        let str: AttrString = """
  Hello \(username, .color(.red)), isn't this \("cool", .color(.blue), .underline(.purple, .single))?

  \(wrap: """
    \(" Merry Xmas! ", .font(.systemFont(ofSize: 36)), .color(.red), .bgColor(.yellow))
    \(image: UIImage(named: "ic_launcher")!)
    """, .alignment(.center))

  Go there to \("learn more about String Interpolation", .link("https://github.com/apple/swift-evolution/blob/master/proposals/0228-fix-expressiblebystringinterpolation.md"), .underline(.blue, .single))!
  """
        contentLabel.attributedText = str.attributedString
    }
    

    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

}
