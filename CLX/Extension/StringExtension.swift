//
//  StringExtension.swift
//  CLX
//
//  Created by MrQi on 2025/6/6.
//

import Foundation

protocol RegexString {
    /// 是否纯数字字符串
    var isDigital: Bool { get }
    
    /// 是否纯小写字母
    var isLowercaseLetter: Bool {get}
    
    /// 是否纯大写字母
    var isCapitalLetters: Bool {get }
    
    /// 是否混合字母
    var isMixedLetters: Bool {get}
    
    /// 是否大写字母+数字
    var isCapitalLettersAndDigital: Bool {get }
    
    /// 是否小写字母+数字
    var isLowercaseLetterAndDigital: Bool {get }
    
    /// 是否混合字母+数字
    var isMixedLettersAndDigital: Bool {get}
}

extension String?: RegexString {
    var isDigital: Bool {
        guard let self = self else { return false }
        return self.isDigital
    }
    
    var isLowercaseLetter: Bool {
        guard let self = self else { return false }
        return self.isLowercaseLetter
    }
    
    var isCapitalLetters: Bool {
        guard let self = self else { return false }
        return self.isCapitalLetters
    }
    
    var isMixedLetters: Bool {
        guard let self = self else { return false }
        return self.isMixedLetters
    }
    
    var isCapitalLettersAndDigital: Bool {
        guard let self = self else { return false }
        return self.isCapitalLettersAndDigital
    }
    
    var isLowercaseLetterAndDigital: Bool {
        guard let self = self else { return false }
        return self.isLowercaseLetterAndDigital
    }
    
    var isMixedLettersAndDigital: Bool {
        guard let self = self else { return false }
        return self.isMixedLettersAndDigital
    }
}

extension String: RegexString {
    var isDigital: Bool {
        return Regex.isDigital(self)
    }
    
    var isLowercaseLetter: Bool {
        return Regex.isLetter(self, type: .lower)
    }
    
    var isCapitalLetters: Bool {
        return Regex.isLetter(self, type: .capitalize)
    }
    
    var isMixedLetters: Bool {
        return Regex.isLetter(self)
    }
    
    var isCapitalLettersAndDigital: Bool {
        return Regex.isDigitalAndLetter(self, type: .capitalize)
    }
    
    var isLowercaseLetterAndDigital: Bool {
        return Regex.isDigitalAndLetter(self, type: .lower)
    }
    
    var isMixedLettersAndDigital: Bool {
        return Regex.isDigitalAndLetter(self)
    }
}
