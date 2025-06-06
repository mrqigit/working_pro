//
//  IpCheckCtrl.swift
//  CLX
//
//  Created by MrQi on 2025/6/5.
//

import UIKit
import Foundation

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
        guard let list: [String] = inputFile.text?.components(separatedBy: ".") as? [String] else {
            resultText.text = "ip地址格式不合法"
            return
        }
        if list.count < 4 {
            resultText.text = "ip地址长度不合法"
            return
        }
        
        for item in list {
            /// 判断是否三位数以内
            if item.count > 3 {
                resultText.text = "ip地址不合法，长度超出限制"
                return
            }
            /// 判断是否是数字组成
            if !item.isDigital {
                resultText.text = "ip地址不合法，包含非数字字符"
                return
            }
            
            /// 判断是否是[0,255]区间
            let value: Int = Int(item) ?? -1
            if value < 0 || value > 255 {
                resultText.text = "ip地址不合法，区间超过[0,255]"
                return
            }
        }
        
        resultText.text = "恭喜💐，ip地址是合法的"
    }
        
    @objc
    func ipv6Action() {
        if inputFile.text?.isEmpty == true {
            resultText.text = "请输入需要检测的ip地址"
            return
        }
        /// 裁剪判断是否是8组
        guard let list = inputFile.text?.components(separatedBy: ":") as? [String] else {
            resultText.text = "ip地址格式不合法"
            return
        }
        if list.count < 8 {
            resultText.text = "ip地址长度不合法"
            return
        }
        if list.count(where: {$0.isEmpty}) > 1 {
            resultText.text = "ip地址包含多个::"
            return
        }
        for item in list {
            if item.count > 4 {
                resultText.text = "ip地址单个长度超过4"
                return
            }
            if !item.isLowercaseLetterAndDigital && !item.isDigital && !item.isMixedLetters && !item.isEmpty {
                resultText.text = "ip地址不合法，只能包含数字和小写字母"
                return
            }
        }
        resultText.text = "恭喜💐，ip地址是合法的"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var ipString = ""
        for index in 0...8 {
            if index % 2 == 0 {
                ipString += "\(ipString.isEmpty ? "":":")\(index)\(index)\(index)\(index)"
            } else {
                ipString += ":"
            }
        }
        print(ipString)
        let list = ipString.components(separatedBy: ":")
        print(list)
    }
}
