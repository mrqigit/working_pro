//
//  Request.swift
//  CLX
//
//  Created by MrQi on 2024/5/29.
//

import Foundation
 
 enum Task {
    case requestData(Data)
    case requestParams([String: Any])
    case requestString(String)
    case uploadFile(URL)
    case downloadFile(URL)
}
