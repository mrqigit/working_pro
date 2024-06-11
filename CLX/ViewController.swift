//
//  SceneDelegate.swift
//  CLX
//
//  Created by MrQi on 2024/5/8.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    lazy var listView: UITableView = {
        let tableView = UITableView();
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        return tableView
    }()
    
    lazy var dataSource: Array = {
        return [
            [
                "title":"WKWebView",
                "ctrl": WKWebViewCtrl()
            ],
            [
                "title":"GCD&Thread",
                "ctrl": GCDOrThreadCtrl()
            ],
            [
                "title":"BLOCK",
                "ctrl":BlockCtrl()
            ],
            [
                "title":"LOCATION",
                "ctrl":LocationCtrl()
            ],
            [
                "title":"NSPredicate",
                "ctrl":NSPredicateCtrl()
            ],
            [
                "title":"NeedsLayout",
                "ctrl":NeedsLayoutCtrl()
            ],
            [
                "title":"AnalysisCtrl",
                "ctrl":AnalysisCtrl()
            ],
            [
                "title":"DrawImage",
                "ctrl":DrawImageCtrl()
            ],
            [
                "title":"Attribute",
                "ctrl":AttributeStringCtrl()
            ],
            [
                "title":"Firework",
                "ctrl":SparkTrajectoryCtrl()
            ],
            [
                "title":"堆栈",
                "ctrl":HeapOrStackCtrl()
            ],
            [
                "title":"Enum",
                "ctrl":EnumCtrl()
            ],
            [
                "title": "二叉树",
                "ctrl": BinaryTreeCtrl()
            ]
        ];
    }()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell(style: .value1, reuseIdentifier: "ListTableViewCell")
        }
        if let title = dataSource[indexPath.row]["title"] as? String {
            cell.label.text = title
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let ctrl = dataSource[indexPath.row]["ctrl"] as? UIViewController else { return }
        navigationController?.pushViewController(ctrl, animated: true)
    }
}
