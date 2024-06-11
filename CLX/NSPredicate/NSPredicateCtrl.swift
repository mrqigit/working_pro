//
//  NSPredicateCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/13.
//

import UIKit

class NSPredicateCtrl: UIViewController {

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
        persons.append(Person(name: "MrQi\(persons.count + 1)号", age: 10 + persons.count))
    }
    
    lazy var searchBtn: UIButton = {
        return createButton("查询数据", .red, #selector(searchAction), self)
    }()
    
    @objc
    func searchAction() {
        var pred = ""
        switch segment.selectedSegmentIndex {
        case 0:
            pred = "SELF.age >= 18"
            break
        case 1:
            pred = "SELF.age < 18"
            break
        case 2:
            pred = "(SELF.age >= 13) AND (SELF.age <= 18)"
            break
        case 3:
            pred = "SELF.age >= 65"
            break
        case 4:
            pred = "(SELF.age >= 21) AND (SELF.age <= 30)"
            break
        case 5:
            pred = "SELF.age >= 70"
            break
        default:
            break
        }
        persons.map { person in
            if NSPredicate(format: pred).evaluate(with: person) {
                print(person.toString())
            }
        }
        
    }
    
    lazy var segment: UISegmentedControl = {
        let ctrl = UISegmentedControl(items: ["而立","未冠","弱冠","花甲","不惑","古稀"])
        ctrl.selectedSegmentIndex = 0
        return ctrl
    }()
}
//bool get isAdult => age >= 18;
//
//bool get isChild => age < 18;
//
//bool get isTeenager => age >= 13 && age <= 18;
//
//bool get isSeniorCitizen => age >= 65;
//
//bool get isYoungAdult => age >= 21 && age <= 30;
//
//bool get isElderly => age >= 70;
