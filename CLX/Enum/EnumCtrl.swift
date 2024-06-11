//
//  EnumCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/29.
//

import UIKit

class EnumCtrl: UIViewController {
    
    var page: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        requestData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        page += 1
        requestData()
    }
    
    func requestData() {
        Provider<NetAPI>().request(.home(page: page, searck: "")) { (response) in
            print(response)
        } fail: { (msg) in
            print(msg)
        }
    }

}
