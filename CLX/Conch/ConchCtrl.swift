//
//  ConchCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/6/13.
//

import UIKit

class ConchCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(actionBtn)
        actionBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(45)
        }
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        

    }
    
    
    
    lazy var actionBtn: UIButton = {
        let btn = createButton("按钮", .red, #selector(buttonAction), self)
//        btn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        return btn
    }()
    
    @objc
    func buttonAction() {
        print("------------按钮点击")
        
    }

    @objc
    func tapAction() {
        print("------------手势点击")
    }
}

extension ConchCtrl {
    override class func resolveClassMethod(_ sel: Selector!) -> Bool {
        return true
    }
    
//    override class func method(for aSelector: Selector!) -> IMP! {
//        return method_getImplementation(class_getMethodImplementation(self, #selector(tempFunc))!)
//    }
//    
//    override class func forwardingTarget(for aSelector: Selector!) -> Any? {
//        
//    }
//    
//    override class func doesNotRecognizeSelector(_ aSelector: Selector!) {
//        
//    }
//    
//    override func doesNotRecognizeSelector(_ aSelector: Selector!) {
//        
//    }
//    
//    @objc func tempFunc(_ key: Any...) {
//        print(key)
//    }
}

/*
 1、View添加手势，View上添加Button，Button添加点击事件
    只响应Button按钮点击事件
 2、View添加Button，Button添加手势
    只响应手势
 */
