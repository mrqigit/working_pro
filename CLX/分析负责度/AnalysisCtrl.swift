//
//  AnalysisCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import UIKit

class AnalysisCtrl: UIViewController {
    
    var numberArr: [Int]?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(arcdomArr)
        view.addSubview(sortBtn)
        view.addSubview(sliceBtn)
        view.addSubview(sliceOptBtn)
        arcdomArr.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
            make.left.right.equalTo(0)
            make.height.equalTo(45)
        }
        
        sortBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(arcdomArr.snp.bottom).offset(20)
            make.left.right.equalTo(0)
            make.height.equalTo(45)
        }
        
        sliceBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(sortBtn.snp.bottom).offset(20)
            make.left.right.equalTo(0)
            make.height.equalTo(45)
        }
        
        sliceOptBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(sliceBtn.snp.bottom).offset(20)
            make.left.right.equalTo(0)
            make.height.equalTo(45)
        }
    }
    
    lazy var arcdomArr: UIButton = {
        return createButton("随机数组", .red, #selector(arcdomArrayAction), self)
    }()
    
    @objc
    func arcdomArrayAction() {
        numberArr = []
        var arcdom = 1
        let startTime = Date()
        for _ in 0...5500000 {
            arcdom = Int.random(in: 0...5500000)
            numberArr?.append(arcdom)
        }
        print("-----------TimeInterval:\(startTime.timeInterval)")
    }
    
    lazy var sortBtn: UIButton = {
        return createButton("先排序后截取", .red, #selector(sortAndSlice), self)
    }()
    
    @objc
    func sortAndSlice() {
        let startTime = Date()
        let tempArr = numberArr?.sortPrefix(maxLength: 5, by: { element, sortItem in
            return element <= sortItem
        })
        print("-----------TimeInterval:\(startTime.timeInterval)--------\(tempArr)")
    }
    
    lazy var sliceBtn: UIButton = {
        return createButton("先截取后排序", .red, #selector(sliceAndSort), self)
    }()
    
    @objc
    func sliceAndSort() {
        let startTime = Date()
        let tempArr = numberArr?.smallest(maxLength: 5, by: { element, sortItem in
            return element <= sortItem
        })
        print("-----------TimeInterval:\(startTime.timeInterval)--------\(tempArr)")
    }
    
    lazy var sliceOptBtn: UIButton = {
        return createButton("先排序后截取优化", .red, #selector(sliceAndSortOpt), self)
    }()
    
    @objc
    func sliceAndSortOpt() {
        let startTime = Date()
        let tempArr = numberArr?.sortSmallAndPrefix(maxLength: 5, by: { element, sortItem in
            return element <= sortItem
        })
        print("-----------TimeInterval:\(startTime.timeInterval)--------\(tempArr)")
    }
}
