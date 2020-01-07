//
//  UIApplication+ZLAdd.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    /// 文档URL
    private var documentsURL: URL {
        get {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        }
    }
    
    /// 文档路径
    private var documentsPath: String {
        get {
            return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        }
    }
    
    /// 缓存URL
    private var cachesURL: URL {
        get {
            return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).last!
        }
    }
    
    /// 缓存路径
    private var cachesPath: String {
        get {
            return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        }
    }
    
    /// 目录URL
    private var libraryURL: URL {
        get {
            return FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last!
        }
    }
    
    /// 目录路径
    private var libraryPath: String {
        get {
            return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
        }
    }
    
    /// APP名称
    private var appBundleName: String {
        get {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
        }
    }
    
    private var appBundleID: String {
        get {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as! String
        }
    }
    
    /// 版本号
    private var appVersion: String {
        get {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        }
    }
    
    /// 构建版本号
    private var appBuildVersion: String {
        get {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        }
    }
    
    
}
