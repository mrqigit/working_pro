//
//  CrashHoolCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/7/4.
//

import UIKit

class CrashHoolCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(personBtn)
        view.addSubview(personClassBtn)
        view.addSubview(manBtn)
        view.addSubview(manClassBtn)
        
        personBtn.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(40)
        }
        
        personClassBtn.snp.makeConstraints { make in
            make.top.equalTo(personBtn.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(40)
        }
        
        manBtn.snp.makeConstraints { make in
            make.top.equalTo(personClassBtn.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(40)
        }
        
        manClassBtn.snp.makeConstraints { make in
            make.top.equalTo(manBtn.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(40)
        }
    }
    
    lazy var manBtn: UIButton = {
        return createButton("男人-对象方法",.red, #selector(manAction), self)
    }()
    
    lazy var manClassBtn: UIButton = {
        return createButton("男人-类方法",.red, #selector(manClassAction), self)
    }()
    
    lazy var personBtn: UIButton = {
        return createButton("人类-对象方法",.red, #selector(personAction), self)
    }()
    
    lazy var personClassBtn: UIButton = {
        return createButton("人类-类方法",.red, #selector(personClassAction), self)
    }()
    
    @objc
    func manAction() {
        KGMan().instanceMethod()
    }
    
    @objc
    func manClassAction() {
        KGMan.classMethod()
    }

    @objc
    func personAction() {
        KGPerson().instanceMethod()
    }
    
    @objc
    func personClassAction() {
        KGPerson.classMethod()
    }
}
