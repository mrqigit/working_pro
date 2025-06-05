//
//  ReversalStringCtrl.swift
//  CLX
//
//  Created by MrQi on 2025/6/5.
//

import UIKit

class ReversalStringCtrl: UIViewController {

    var originString: String = "abcdefghijklmnopqrstuvwxyz"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(reversedBtn)
        view.addSubview(forInBtn)
        view.addSubview(enumeratedBtn)
        
        reversedBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        
        forInBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(reversedBtn.snp_bottomMargin).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        
        enumeratedBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forInBtn.snp_bottomMargin).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }

    }

    lazy var reversedBtn: UIButton = {
        return createButton(
            "Swift Reversed",
            .red,
            #selector(reversedAction),
            self
        )
    }()

    lazy var forInBtn: UIButton = {
        return createButton("For In", .red, #selector(forInAction), self)
    }()
    
    lazy var enumeratedBtn: UIButton = {
        return createButton(
            "Swift Enumerated",
            .red,
            #selector(enumeratedAction),
            self
        )
    }()

    @objc
    func reversedAction() {
        print(String(originString.reversed()))
    }
    @objc
    func forInAction() {
        var reversedString = ""
        for char in originString {
            reversedString.insert(char, at: reversedString.startIndex)
        }
        print(reversedString)
    }
    @objc
    func enumeratedAction() {
        let reversedString = originString.enumerated().reduce("") { (result, element) in
            let (_, char) = element
            return String(char) + result
        }
        print(reversedString)
    }

}
