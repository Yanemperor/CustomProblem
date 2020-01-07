//
//  ZLEnums.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import HandyJSON

/// 导航栏按钮类型
///
/// - text//: 文字
/// - image: 图片
enum BarButtonItemType {
    case text
    case image
}


enum CircularType: Int {
    case normal         = 1     // 默认的
    case different      = 2     // 不同概率, 按概率的比例分转盘大小的
    case custom         = 3     // 不同概率, 自定义转盘比例大小的
}

enum BannerAdsType {
    case normal                 // 正常的横幅广告
    case start                  // 启动广告
    case incentive              // 激励广告
}
