//
//  ZLActivity.swift
//  WhatEat
//
//  Created by 周子龙 on 2019/12/26.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import StoreKit

class ZLActivity: UIActivity {
    
    let LGActivityType =  "LGActivityType"
    
    var lgTitle: String?
    var lgImage: UIImage?
    var lgUrl: URL?
    var lgShareContexts: [Any]?
    //设置title  和 image会在弹出视图里面出现一个自定义的应用，title为应用名称  image为应用图标  shareContext是存放分享的内容的
    convenience init(title: String, image: UIImage, url: URL?, shareContext:[Any]) {
        self.init()
        lgTitle = title
        lgImage = image
        if url != nil {
           lgUrl = url
        }
        lgShareContexts = shareContext
    }
    
    convenience init(title: String, url: URL?) {
        self.init()
        lgTitle = title
        if url != nil {
           lgUrl = url
        }
    }
    
    
    override init() {
        super.init()
    }
    
    // default is UIActivityCategoryAction.
    override class var activityCategory: UIActivity.Category {
        return .share
    }
    
    // default returns nil. subclass must override and must return non-nil value
    override var activityImage: UIImage? {
        return lgImage
    }
    
    // default returns nil. subclass must override and must return non-nil value
    override var activityTitle: String? {
        return lgTitle
    }
    
    var activityUrl: URL? {
        return lgUrl
    }
    
    // default returns nil. subclass may override to return custom activity type that is reported to completion handler
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: LGActivityType)
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        if activityItems.count > 0 {
            return true;
        }
        return false;
    }
    
     //准备分享所进行的方法，通常在这个方法里面，把item中的东西保存下来,items就是要传输的数据
    override func prepare(withActivityItems activityItems: [Any]) {
        print("activityItems --- \(activityItems)")
    }
    
    override func perform() {
    ///在这里写你自定义的应用 分享点击以后需要做的操作，比如点击需要打开链接、复制等等
        self.activityDidFinish(true)
    }
}
