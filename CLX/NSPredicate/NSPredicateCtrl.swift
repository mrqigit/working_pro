//
//  NSPredicateCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/13.
//

import UIKit

class NSPredicateCtrl: UIViewController {
    
    var age: AgeEnum = .minors

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(addBtn)
        view.addSubview(searchBtn)
        view.addSubview(segment)
        
        addBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(45)
            make.top.equalTo(150)
        }
        
        searchBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(addBtn)
            make.height.equalTo(addBtn)
            make.top.equalTo(addBtn.snp.bottom).offset(20)
        }
        
        segment.snp.makeConstraints { make in
            make.top.equalTo(searchBtn.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(45)
        }
    }
    
    lazy var persons: [Person] = [];
    
    lazy var addBtn: UIButton = {
        return createButton("添加数据", .red, #selector(addAction), self)
    }()
    
    @objc
    func addAction() {
        persons.append(Person(name: "MrQi\(persons.count + 1)号", age: Int(arc4random_uniform(150))))
    }
    
    lazy var searchBtn: UIButton = {
        return createButton("查询数据", .red, #selector(searchAction), self)
    }()
    
    @objc
    func searchAction() {
        age = AgeEnum(rawValue: segment.selectedSegmentIndex) ?? .minors
        let childrens = persons.filter({NSPredicate(format: age.format).evaluate(with:$0)})
        childrens.forEach { (per) in
            print("name:\(String(describing: per.name)),age:\(per.age)")
        }
    }
    
    lazy var segment: UISegmentedControl = {
        let ctrl = UISegmentedControl(items: AgeEnum.allCase)
        ctrl.selectedSegmentIndex = 0
        return ctrl
    }()
}

protocol AgePredicate {
    var format: String {get}
    var tip: String {get}
}

enum AgeEnum: Int {
    case minors
    case teenagers
    case adult
    case young
    case middleAged
    case elderly
}

extension AgeEnum: AgePredicate {
    var format: String {
        switch self {
        case .minors:
            return "SELF.age < 18"
        case .teenagers:
            return "(SELF.age >= 13) AND (SELF.age <= 18)"
        case .adult:
            return "SELF.age >= 18"
        case .young:
            return "(SELF.age >= 18) AND (SELF.age <= 30)"
        case .middleAged:
            return "SELF.age >= 30 AND (SELF.age <= 50)"
        case .elderly:
            return "SELF.age >= 60"
        }
    }
    
    var tip: String {
        switch self {
        case .minors:
            return "未成年"
        case .teenagers:
            return "青少年"
        case .adult:
            return "成年人"
        case .young:
            return "青年人"
        case .middleAged:
            return "中年人"
        case .elderly:
            return "老年人"
        }
    }
    
    static var allCase: [String] {
        return [AgeEnum.minors,AgeEnum.teenagers,AgeEnum.adult,AgeEnum.young,AgeEnum.middleAged,AgeEnum.elderly,].map({$0.tip})
    }
}
