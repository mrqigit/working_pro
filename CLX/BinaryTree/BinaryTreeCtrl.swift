//
//  BinaryTreeCtrl.swift
//  CLX
//
//  Created by MrQi on 2024/6/11.
//

import UIKit

class BinaryTreeCtrl: UIViewController {
    
    let randomArray = [36, 24, 26, 60, 21, 32, 30, 29, 74,0]
    
    var tree: TreeNode?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        view.addSubview(createBinary)
        view.addSubview(preBinary)
        view.addSubview(sufBinary)
        view.addSubview(centerBinary)
        view.addSubview(nodesBinary)
        view.addSubview(maxDegreeBinary)
        view.addSubview(minDegreeBinary)
        view.addSubview(levelBinary)
        
        createBinary.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
            make.top.equalTo(100)
        }
        
        preBinary.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(createBinary.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        sufBinary.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(preBinary.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        centerBinary.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(sufBinary.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        nodesBinary.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(centerBinary.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        maxDegreeBinary.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(nodesBinary.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        minDegreeBinary.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(maxDegreeBinary.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        levelBinary.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(minDegreeBinary.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
    }
    
    lazy var createBinary: UIButton = {
        return createButton("生成二叉树", .red, #selector(createBinaryAction), self)
    }()
    
    lazy var preBinary: UIButton = {
        return createButton("先序遍历二叉树", .red, #selector(preBinaryAction), self)
    }()
    
    lazy var sufBinary: UIButton = {
        return createButton("后序遍历二叉树", .red, #selector(sufBinaryAction), self)
    }()
    
    lazy var centerBinary: UIButton = {
        return createButton("中序遍历二叉树", .red, #selector(centerBinaryAction), self)
    }()
    
    lazy var nodesBinary: UIButton = {
        return createButton("二叉树叶子结点数", .red, #selector(nodesBinaryAction), self)
    }()
    
    lazy var maxDegreeBinary: UIButton = {
        return createButton("二叉树最大度", .red, #selector(maxDegreeBinaryAction), self)
    }()
    
    lazy var minDegreeBinary: UIButton = {
        return createButton("二叉树最小度", .red, #selector(minDegreeBinaryAction), self)
    }()
    
    lazy var levelBinary: UIButton = {
        return createButton("二叉树深度", .red, #selector(levelBinaryAction), self)
    }()
    
    @objc
    func createBinaryAction() {
        for item in randomArray {
            if tree == nil {
                tree = TreeNode(value: item)
            } else {
                tree?.push(item: item)
            }
        }
    }
    
    @objc
    func preBinaryAction() {
        let list: [Int?] = TreeNode.pre(node: tree)
        print(list)
    }
    
    @objc
    func sufBinaryAction() {
        let list: [Int?] = TreeNode.suf(node: tree)
        print(list)
    }
    
    @objc
    func centerBinaryAction() {
        let list: [Int?] = TreeNode.center(node: tree)
        print(list)
    }
    
    @objc
    func nodesBinaryAction() {
        print(TreeNode.nodes(node: tree))
    }
    
    @objc
    func maxDegreeBinaryAction() {
        print(TreeNode.degreeMax(node: tree))
    }
    
    @objc
    func minDegreeBinaryAction() {
        print(TreeNode.degreeMin(node: tree))
    }
    
    @objc
    func levelBinaryAction() {
        print(TreeNode.level(node: tree))
    }
}
