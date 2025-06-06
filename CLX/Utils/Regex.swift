//
//  Regex.swift
//  CLX
//
//  Created by MrQi on 2025/6/6.
//

import Foundation

struct Regex {
    
    /// 是否纯数字字符串
    static func isDigital(_ str: String) -> Bool {
        return regexString(str, type: .digital)
    }
    
    /// 是否字母字符串
    static func isLetter(_ str: String, type: LetterType = .mix) -> Bool {
        return regexString(str, type: .letter(type))
    }
    
    /// 是否数字+字母字符串
    static func isDigitalAndLetter(_ str: String, type: LetterType = .mix) -> Bool {
        return regexString(str, type: .digitalAndLetter(type))
    }
    
    /// 正则匹配字符串
    static func regexString(_ str: String, type: RegexType) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: type.pattern, options: [])
            let range = NSRange(location: 0, length: str.utf16.count)
            let matchs = regex.matches(in: str, options: [], range: range)
            return !matchs.isEmpty
        } catch {
            return false
        }
    }
}
