//
//  Provider.swift
//  CLX
//
//  Created by MrQi on 2024/5/29.
//

import Foundation

protocol ProviderPtl {
    
    associatedtype Target: TaskProtocol
    func request(_ target: Target, succ: (_ response: Any) -> Void, fail: (_ error: Any) -> Void)
}

class Provider<Target: TaskProtocol>: ProviderPtl {
    func request(_ target: Target, succ: (Any) -> Void, fail: (Any) -> Void) {
        guard let page = target.params["page"] as? Int else {
            fail("失败了:\(target.params)")
            return }
        if page == 1 {
            succ("成功了:\(target.params)")
        } else {
            fail("失败了:\(target.params)")
        }
    }
}
