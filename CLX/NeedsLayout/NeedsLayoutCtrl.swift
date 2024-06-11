//
//  NeedsLayoutCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/13.
//

import UIKit

class NeedsLayoutCtrl: UIViewController {
    
    var count: Int = 0
    var status: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(childView)
        childView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(400)
        }
    }
    
    lazy var childView: NeedsFirstView = {
        let tempView = NeedsFirstView()
        return tempView
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if count >= 400 {
            status = true
        }
        
        if count <= 0 {
            status = false
        }
        if status {
            count -= 10
        } else {
            count += 10
        }
        childView.snp.remakeConstraints { make in
            make.left.right.equalTo(0)
            make.top.equalTo(400 - count)
        }
    }
}
