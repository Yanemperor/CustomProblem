//
//  UIView+ZLAdd.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    var y: CGFloat {
        set {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
        get {
            return frame.origin.y
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.origin = newValue
            frame = tempFrame
        }
    }
    
    
    
    var left: CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return x + width
        }
        set {
            x = newValue - width
        }
    }
    
    var top: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
    
    
    var bottom: CGFloat {
        get {
            return y + height
        }
        set {
            y = newValue - height
        }
    }
    
    var centerX: CGFloat {
        get {
            return center.x
        }
        set {
            center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    var centerY: CGFloat {
        get {
            return center.y
        }
        set {
            center = CGPoint(x: center.x, y: newValue)
        }
    }
    
}
