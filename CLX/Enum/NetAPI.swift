//
//  API.swift
//  CLX
//
//  Created by MrQi on 2024/5/29.
//

import Foundation

enum NetAPI {
    case home(page: Int, searck: String?)
}



extension NetAPI: TaskProtocol {
    
    var baseUrl: URL {
        return URL(string: "https://www.baidu.com")!
    }
    
    var mode: RequestMode {
        switch self {
        case .home:
            return .GET
        }
    }
    
    var task: Task {
        switch self {
        case .home(_, _):
            return .requestParams(params)
        }
    }
    
    var path: String {
        switch self {
        case .home:
            return "/api/home"
        }
    }
    
    var header: [String : Any] {
        return ["":""]
    }
    
    var params: [String : Any] {
        switch self {
        case .home(let page, let search):
            return ["page": page, "search": search ?? ""]
        }
    }
}
