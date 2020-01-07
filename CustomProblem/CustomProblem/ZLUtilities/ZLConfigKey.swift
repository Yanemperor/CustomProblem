//
//  ZLConfigKey.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/15.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation

struct GoogleMobileAds {
    #if DEBUG
    static let bannerID = "ca-app-pub-3940256099942544/2934735716"        // 谷歌横幅广告ID
    static let interstitialID = "ca-app-pub-3940256099942544/4411468910"        // 谷歌插页广告ID
    static let incentiveID = "ca-app-pub-3940256099942544/1712485313"       // 谷歌激励广告

    #else
    static let bannerID = "ca-app-pub-3940256099942544/2934735716"        // 谷歌横幅广告ID
    static let interstitialID = ""        // 谷歌插页广告ID
    static let incentiveID = ""       // 谷歌激励广告
    #endif

}


