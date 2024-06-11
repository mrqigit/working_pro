//
//  Extension.swift
//  CLX
//
//  Created by MrQi on 2024/5/14.
//

import Foundation

extension Sequence {
    
    func sortPrefix(maxLength: Int, by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows -> ArraySlice<Self.Element> {
        return try! self.sorted(by: areInIncreasingOrder).prefix(upTo: maxLength)
    }
    
    func smallest(maxLength: Int, by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) -> [Element] {
        var result = try! self.prefix(maxLength).sorted(by: areInIncreasingOrder)
        for e in self.dropFirst(maxLength) {
            if let insertionIndex = result.firstIndex(where: {try! areInIncreasingOrder(e, $0)}) {
                result.insert(e, at: insertionIndex)
                result.removeLast()
            }
        }
        return result
    }
    
    func sortSmallAndPrefix(maxLength: Int, by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows -> Array<Self.Element> {
        var result = try! self.prefix(maxLength).sorted(by: areInIncreasingOrder)
        for e in self.dropFirst(maxLength) {
            if let last = result.last, try! areInIncreasingOrder(last, e) {
                continue
            }
            if let insertionIndex = result.firstIndex(where: {try! areInIncreasingOrder(e, $0)}) {
                result.insert(e, at: insertionIndex)
                result.removeLast()
            }
        }
        return result
    }
}

extension Date {
    
    var timeInterval: TimeInterval {
        return Date().timeIntervalSince1970 - self.timeIntervalSince1970
    }
}
