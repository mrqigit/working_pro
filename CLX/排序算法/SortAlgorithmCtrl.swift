//
//  SortAlgorithmCtrl.swift
//  CLX
//
//  Created by MrQi on 2025/4/7.
//

import UIKit

class SortAlgorithmCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension SortAlgorithmCtrl {
    func bubbleSorting( nums: inout [Int]) {
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                if nums[i] > nums[j] {
                    nums.swapAt(i, j)
                }
            }
        }
    }
    
    func insertionSort(_ array: [Int]) -> [Int] {
        var result = array
        for i in 1..<result.count {
            let key = result[i]
            var j = i - 1
            while j >= 0 && result[j] > key {
                result[j + 1] = result[j]
                j -= 1
            }
            result[j + 1] = key
        }
        return result
    }
}

extension SortAlgorithmCtrl {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ///  一个数组如何取前k大的数
        let randomIntList: (Int) -> [Int] = { (max: Int) -> [Int] in
            var tempList: [Int] = []
            var index = 0
            while index < max {
                tempList.append(Int.random(in: Range(NSRange(location: 0, length: max))!))
                index += 1
            }
            return tempList
        }
        var temp = randomIntList(10)
//        let result = findTopK(temp, k: 10)
        print(temp)
        print("-----开始----")
        
        let result = insertionSort(temp)
        print("-----结束----")
        print(result)
    }

    
    func findTopK(_ nums: [Int], k: Int) -> [Int] {
        var minHeap = [Int]()
        // 构建小顶堆
        for num in nums.prefix(k) {
            minHeap.append(num)
            siftUp(&minHeap, at: minHeap.count - 1)
        }
        
        for num in nums.dropFirst(k) {
            if num > minHeap[0] {
                minHeap[0] = num
                siftDown(&minHeap, at: 0)
            }
        }
        return minHeap
    }

    func siftUp(_ heap: inout [Int], at index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    func siftDown(_ heap: inout [Int], at index: Int) {
        let n = heap.count
        var parent = index
        var leftChild = 2 * parent + 1
        while leftChild < n {
            var minChild = leftChild
            let rightChild = leftChild + 1
            if rightChild < n && heap[rightChild] < heap[leftChild] {
                minChild = rightChild
            }
            if heap[minChild] < heap[parent] {
                heap.swapAt(minChild, parent)
                parent = minChild
                leftChild = 2 * parent + 1
            } else {
                break
            }
        }
    }
}
