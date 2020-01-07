//
//  ZLSystemShare.swift
//  WhatEat
//
//  Created by 周子龙 on 2019/12/26.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import UIKit

class ZLSystemShare: NSObject {
    
    var parentVc: UIViewController?

    static let manager = ZLSystemShare()
    private override init() {
        super.init()
    }
    
    func share(shreVC: UIViewController, title: String, shareUrl: URL?) {
        parentVc = shreVC
        var activityItems = [Any]()
        activityItems = [title, shareUrl as Any]
//        let activity = ZLActivity(title: title, url: shareUrl)
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: [])
        activityVC.excludedActivityTypes = []
        activityVC.isModalInPopover = true
        shreVC.present(activityVC, animated: true, completion: nil)
    }
    
    
    func share(shreVC: UIViewController, orText: String, trText: String, shareUrl: URL?) {
        parentVc = shreVC
        var activityItems = [Any]()
        if shareUrl == nil {
            activityItems = [orText, trText]
        } else {
            activityItems = [orText, trText,  shareUrl as Any]
        }
//        let activity = ZLActivity(title: "成考宝典", url: shareUrl)
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: [])
        //表示去掉不想显示的按钮  即第一点里面所包含的type 放到这里
        activityVC.excludedActivityTypes = []
        activityVC.isModalInPopover = true
        shreVC.present(activityVC, animated: true, completion: nil)
    }
}
