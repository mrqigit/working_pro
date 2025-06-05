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
        view.addSubview(inputFile)
        view.addSubview(resultText)
        
        inputFile.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(50)
            make.centerY.equalToSuperview()
            make.height.equalTo(45)
        }
        
        ipv4Btn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(50)
            make.top.equalTo(inputFile.snp_bottomMargin).offset(10)
            make.height.equalTo(45)
        }
        
        ipv6Btn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(50)
            make.top.equalTo(ipv4Btn.snp_bottomMargin).offset(10)
            make.height.equalTo(45)
        }
        
        resultText.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(50)
            make.top.equalTo(ipv6Btn.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
        }
        
    }
    

    lazy var ipv4Btn: UIButton = {
        return createButton("ipv4", .red, #selector(ipv4Action), self)
    }()
    
    lazy var ipv6Btn: UIButton = {
        return createButton("ipv6", .red, #selector(ipv6Action), self)
    }()
    
    lazy var inputFile: UITextField = {
        let tempView = UITextField()
        tempView.backgroundColor = .red
        tempView.placeholder = "请输入ip地址"
        return tempView
    }()
    
    lazy var resultText: UILabel = {
       let tempView = UILabel()
        tempView.font = .systemFont(ofSize: 16)
        tempView.textColor = .red
        return tempView
    }()
    
    @objc
    func ipv4Action() {
        if inputFile.text?.isEmpty == true {
            resultText.text = "请输入需要检测的ip地址"
            return
        }
        /// 裁剪判断是否是4组
        
        
    }
        
    @objc
    func ipv6Action() {
        
    }
}
