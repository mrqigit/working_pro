//
//  PhotosViewController.swift
//  CLX
//
//  Created by MrQi on 2024/11/7.
//

import UIKit
import PhotosUI

class PhotosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(addBtn)
        addBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    lazy var addBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("打开相册", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(addPhotosAction), for: .touchUpInside)
        return button
    }()
    
    @objc
    func addPhotosAction() {
        var config = PHPickerConfiguration()
        let pickerController = PHPickerViewController(configuration: config)
        config.filter = .images
        self.navigationController?.pushViewController(pickerController, animated: true)
    }
}
