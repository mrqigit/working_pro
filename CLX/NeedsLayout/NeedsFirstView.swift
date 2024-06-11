//
//  NeedsFirstView.swift
//  CLX
//
//  Created by MrQi on 2024/5/13.
//

import UIKit

class NeedsFirstView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(childView)
        childView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    lazy var childView: NeedsScendsView = {
        let tempView = NeedsScendsView()
        return tempView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
        
        print("-------------NeedsFirstView")
        super.setNeedsLayout()
    }
}
