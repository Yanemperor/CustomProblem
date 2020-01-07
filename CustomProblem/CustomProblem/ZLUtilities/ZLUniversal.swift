//
//  ZLUniversal.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import UIKit

let kScreenWidth: CGFloat = UIScreen.main.bounds.size.width
let kScreenHeight: CGFloat = UIScreen.main.bounds.size.height
let kCurrentWidth: CGFloat = 375.0   // 6 的宽度

// 系统控件默认高度

let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height

// navigationBarHeight
let kNavigationBarHeight: CGFloat = isFullScreen ? 88 : 64

// tabBarHeight
let kTabBarHeight: CGFloat = isFullScreen ? 49 + 34 : 49

let kEqualToTabBarBottom: CGFloat = isFullScreen ? -34 : 0


func autoSize(number: CGFloat) -> CGFloat {
    var num = number
    num = num * UIScreen.main.bounds.size.width / kCurrentWidth
    return num
}

func autoFont(font: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: font * kScreenWidth / kCurrentWidth)
}

// 是否是刘海屏
var isFullScreen: Bool {
    if #available(iOS 11, *) {
        guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
            return false
        }
        
        if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
            //            print(unwrapedWindow.safeAreaInsets)
            return true
        }
    }
    return false
}

let autoFullScreenBottomHeight: CGFloat = isFullScreen ? 34 : 0


// UITableViewCell 默认高度
let kTableViewRowHeight: CGFloat = 45.0


let kCGFloat_min = CGFloat.leastNormalMagnitude
let kCGFloat_max = CGFloat.greatestFiniteMagnitude



// 占位图片

struct QCPlaceholderKey {
    static let placeholderImage = "placeholderImage"        // 默认的占位图
    
    
}
