//
//  Person.swift
//  CLX
//
//  Created by MrQi on 2024/5/13.
//

import UIKit

@objcMembers
class Person: NSObject {

    var name: String?
    var age: Int = 0;
    var identifier: String?
    
    init(name: String? = nil, age: Int, identifier: String? = nil) {
        self.name = name
        self.age = age
        self.identifier = identifier
    }
    
    func toString() -> String {
        return "姓名：\(name ?? "") 年龄：\(age)"
    }
}
