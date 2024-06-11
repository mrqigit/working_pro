//
//  re.swift
//  CLX
//
//  Created by MrQi on 2024/5/16.
//

protocol Queue {
    associatedtype DataType: Comparable
    
    /**
     将一个新元素插入到队列中。
     - 参数 item：要添加的元素。
     - 返回值：插入是否成功。
     */
    @discardableResult func add(_ item: DataType) -> Bool
    
    /**
     删除首个元素。
     - 返回值：被移除的元素。
     - 抛出值：QueueError 类型的错误。
     */
    @discardableResult func remove() throws -> DataType
    
    /**
     获取到队列中的首个元素，并将其移出队列。
     - 返回值：一个包含队列中首个元素的可选值。
     */
    func dequeue() -> DataType?
    
    /**
     获取队列中的首个元素，但不将它移出队列。
     - 返回值：一个包含队列中首个元素的可选值。
     */
    func peek() -> DataType?
    
    /**
     清空队列。
     */
    func clear() -> Void
}

enum QueueError: Error {
  case noSuchItem(String)
}
