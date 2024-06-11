//
//  KGNetTarget.swift
//  CLX
//
//  Created by MrQi on 2024/5/29.
//

import Foundation

protocol TaskProtocol {
    
    var baseUrl: URL { get }
    
    var mode: RequestMode {get}
    
    var task: Task { get }
    
    var path: String { get }
    
    var header: [String : Any] {get}
    
    var params: [String: Any] { get }
}
