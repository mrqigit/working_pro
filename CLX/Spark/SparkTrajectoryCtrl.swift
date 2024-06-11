//
//  SparkTrajectoryCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/5/15.
//

import UIKit

class SparkTrajectoryCtrl: UIViewController {
    
    private var fireworksController = FountainFireworkController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(fireworkBtn)
        fireworkBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    lazy var fireworkBtn: UIButton = {
        return createButton("🎆🎉🎆🎉", .red, #selector(fireworkAction), self)
    }()
    
    @objc
    func fireworkAction(_ sender: UIButton) {
        self.fireworksController.addFirework(sparks: 10, above: self.fireworkBtn)

        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
