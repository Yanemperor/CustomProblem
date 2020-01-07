//
//  Array+Extension.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/6.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation

extension Array where Element: NSCopying{
    ///返回元素支持拷贝数组的深拷贝
    public var copy:[Element]{
        return self.map {$0.copy(with: nil) as! Element}
    }
}

extension Array{
    public func shuffle() -> Array {
        var list = self
        for index in 0..<list.count {
            let newIndex = Int(arc4random_uniform(UInt32(list.count-index))) + index
            if index != newIndex {
                list.swapAt(index, newIndex)
            }
        }
        return list
    }
}

