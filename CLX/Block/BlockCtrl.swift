//
//  BlockCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/8.
//

import UIKit

class BlockCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
    }
    
    lazy var btn: UIButton = {
        return createButton("按钮", .red, #selector(action), self)
    }()
    
    @objc
    func action() {
        print(backBlock(a: 10, b: 20))
    }
}

extension BlockCtrl {
    func backBlock(a: Int, b: Int) -> Int {
        return {
            return a * b
        }()
    }
}
