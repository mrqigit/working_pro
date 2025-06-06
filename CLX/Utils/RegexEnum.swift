//
//  RegexEnum.swift
//  CLX
//
//  Created by MrQi on 2025/6/6.
//

import Foundation


protocol RegexPattern {
    var pattern: String { get }
}

enum RegexType {
    case digital
    case letter(LetterType)
    case digitalAndLetter(LetterType)
}

enum LetterType {
    case lower
    case capitalize
    case mix
}

extension RegexType: RegexPattern {
    var pattern: String {
        switch self {
        case .digital:
            return "^[0-9]+$"
        case .letter(let type):
            switch type {
            case .lower:
                return "^[a-z]+$"
            case .capitalize:
                return "^[A-Z]+$"
            default:
                return "^[a-zA-Z]+$"
            }
        case .digitalAndLetter(let type):
            switch type {
            case .lower:
                return "^[0-9a-z]+$"
            case .capitalize:
                return "^[0-9A-Z]+$"
            default:
                return "^[0-9a-zA-Z]+$"
            }
        }
    }
}
