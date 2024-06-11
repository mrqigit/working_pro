//
//  TreeNode.swift
//  CLX
//
//  Created by MrQi on 2024/6/11.
//


class TreeNode {
    
    var value: Int
    
    var leftNode: TreeNode?
    
    var rightNode: TreeNode?

    init(value: Int, leftNode: TreeNode? = nil, rightNode: TreeNode? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
    
    /// 添加节点
    func push(item: Int) {
        if item > value {
            if rightNode == nil {
                rightNode = TreeNode(value: item)
            } else {
                rightNode?.push(item: item)
            }
        } else {
            if leftNode == nil {
                leftNode = TreeNode(value: item)
            } else {
                leftNode?.push(item: item)
            }
        }
    }
    
    /// 先序遍历
    static func pre(node: TreeNode?) -> [Int?] {
        if node == nil {
            return []
        }
        let leftArr = pre(node: node?.leftNode)
        let rightArr = pre(node: node?.rightNode)
        var list = [node?.value]
        list.append(contentsOf: leftArr)
        list.append(contentsOf: rightArr)
        return list
    }
    
    /// 后序遍历
    static func suf(node: TreeNode?) -> [Int?] {
        if node == nil {
            return []
        }
        let leftArr = suf(node: node?.leftNode)
        let rightArr = suf(node: node?.rightNode)
        var list: [Int?] = []
        list.append(contentsOf: leftArr)
        list.append(contentsOf: rightArr)
        list.append(node?.value)
        return list
    }
    
    /// 后序遍历
    static func center(node: TreeNode?) -> [Int?] {
        if node == nil {
            return []
        }
        let leftArr = center(node: node?.leftNode)
        let rightArr = center(node: node?.rightNode)
        var list: [Int?] = []
        list.append(contentsOf: leftArr)
        list.append(node?.value)
        list.append(contentsOf: rightArr)
        return list
    }
    
    /// 获取叶子节点数
    static func nodes(node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        if node?.leftNode == nil && node?.rightNode == nil {
            return 1
        }
        return nodes(node: node?.leftNode) + nodes(node: node?.rightNode)
    }
    
    /// 获取最大度
    static func degreeMax(node: TreeNode?) -> Int {
        if node == nil || (node?.leftNode == nil && node?.rightNode == nil) {
            return 0
        }
        
        var maxL = max(degreeMax(node: node?.leftNode), 1)
        var maxR = max(degreeMax(node: node?.rightNode), 1)
        return max(maxL,maxR)
    }
    
    /// 获取最小度
    static func degreeMin(node: TreeNode?) -> Int {
        if node == nil || (node?.leftNode == nil && node?.rightNode == nil) {
            return 0
        }
        
        var minL = min(degreeMin(node: node?.leftNode), 1)
        var minR = min(degreeMin(node: node?.rightNode), 1)
        return min(minL,minR)
    }
    
    /// 虎丘深度
    static func level(node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        
        if node?.leftNode == nil && node?.rightNode == nil {
            return 1
        }
        return max(level(node: node?.leftNode), level(node: node?.rightNode)) + 1
    }
}
