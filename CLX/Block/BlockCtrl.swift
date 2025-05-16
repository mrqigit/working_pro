//
//  BlockCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/8.
//

import UIKit

class BlockCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("当前方法的名称是: \(#function)，类是: \(self.self)")

        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewDidDisappear(animated)
    }
    
    deinit {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
    }
    
    lazy var btn: UIButton = {
        return createButton("按钮", .red, #selector(action), self)
    }()
    
    @objc
    func action() {
        navigationController?.pushViewController(BlockCtrl(), animated: true)
        print(backBlock(a: 10, b: 20))
        print(normalBlock())
        print(argsBlock(a: 10))
        print(argsReturnBlock(a: 10, b: 20))
        let intList = [1,2,3,4,5,6,7,8,9,0,4,5,2,5,1,2,1,1,3,2,1,2,3,4,1,2,3]
        let intMap = intList.reduce(into: [:]) { partialResult, temp in
            partialResult[temp, default: 0] += 1
        }

        let mapList = [
            ["a": 1],
            ["a": 2],
            ["a": 3],
            ["a": 4],
            ["a": 5],
            ["a": 6],
        ]
        
        let doubleMap = mapList.map { temp in
            return temp["a"]
        }
        let greatMap = mapList.filter { temp in
            return temp["a"] ?? 0 > 3
        }
        let evenMap = mapList.filter { temp in
            return (temp["a"] ?? 0) % 2 == 0
        }
        let oddMap = mapList.filter { temp in
            return (temp["a"] ?? 0) % 2 != 0
        }
        let initReduce = mapList.reduce(1) { partialResult, temp in
            (temp["a"] ?? 0) + partialResult
        }
        
        
        print(doubleMap)
        print(greatMap)
        print(evenMap)
        print(oddMap)
        print(initReduce)
        print(intMap)
    }
}

extension BlockCtrl {
    func backBlock(a: Int, b: Int) -> Int {
        return {
            return a * b
        }()
    }
    
    func normalBlock() -> Void {
        return
    }
    
    func argsBlock(a: Int) -> Void {
        return
    }
    
    func argsReturnBlock(a: Int, b: Int) -> Int {
        return a + b
    }
}
