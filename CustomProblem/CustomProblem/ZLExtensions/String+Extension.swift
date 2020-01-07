//
//  String+Extension.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/5.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation

extension String {
    func subString(start: Int, end: Int) -> String {
        if start < end {
            let startIndex = self.index(self.startIndex, offsetBy: start)
            let endIndex = self.index(self.startIndex, offsetBy: end)
            
            return String(self[startIndex..<endIndex])
        }
        return ""
    }
    
    func deleteNewline() -> String {
        if self.isEmpty {
            return self
        }
        let str = self.replacingOccurrences(of: "\n", with: "")
        return str
    }
    /// range转换为NSRange
    func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    func nsRange(key: String) -> NSRange {
        let baseString: NSString = self as NSString
        let range = baseString.range(of: key)
        return range
    }
}
