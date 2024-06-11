//
//  NeedsScendsView.swift
//  CLX
//
//  Created by MrQi on 2024/5/13.
//

import UIKit

class NeedsScendsView: UIView {

    override func setNeedsLayout() {
        
        print("-------------NeedsScendsView")
        super.setNeedsLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        
     addSubview(addBtn)
        addBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
    }
    
    lazy var addBtn: UIButton = {
        return createButton("添加数据", .red, #selector(addAction), self)
    }()
    
    @objc
    func addAction() {
        setNeedsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
