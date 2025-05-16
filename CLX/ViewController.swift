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
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.systemBlue // 设置背景色
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // 设置标题文字颜色
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        } else {
            // Fallback on earlier versions
            navigationController?.navigationBar.barTintColor = UIColor.systemBlue // 设置背景色
            navigationController?.navigationBar.tintColor = UIColor.white // 设置标题和按钮颜色
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] // 设置标题文字颜色
        }
        
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        
        view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewDidDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        print("当前方法的名称是: \(#function)，类是: \(self.self)")
        super.viewDidLayoutSubviews()
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
            ],
            [
                "title": "贝壳-事件分发",
                "ctrl": ConchCtrl()
            ],
            [
                "title": "奔溃防护",
                "ctrl": CrashHoolCtrl()
            ],
            [
                "title": "PHPicker",
                "ctrl": PhotosViewController()
            ],
            [
                "title": "排序算法",
                "ctrl": SortAlgorithmCtrl()
            ],
            [
                "title": "动画",
                "ctrl": AnimationViewController()
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
