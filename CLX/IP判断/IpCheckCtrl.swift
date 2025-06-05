//
//  IpCheckCtrl.swift
//  CLX
//
//  Created by MrQi on 2025/6/5.
//

import UIKit

class IpCheckCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(ipv4Btn)
        view.addSubview(ipv6Btn)
    }
    

    lazy var ipv4Btn: UIButton = {
        return createButton("ipv4", .red, #selector(ipv4Action), self)
    }()
    
    lazy var ipv6Btn: UIButton = {
        return createButton("ipv6", .red, #selector(ipv6Action), self)
    }()
    
    @objc
    func ipv4Action() {
        
    }
        
    @objc
    func ipv6Action() {
        
    }
}
