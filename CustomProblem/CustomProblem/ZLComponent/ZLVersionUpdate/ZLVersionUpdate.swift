//
//  ZLVersionUpdate.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/24.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//1119465603 测试

// 1484750167 正式
class ZLVersionUpdate: NSObject {
    static var shared = ZLVersionUpdate()
    let appleID: String  = "1491874274"
    
    func updateVersion() {
        Alamofire.request("https://itunes.apple.com/cn/lookup?id=" + appleID, method: .post, parameters: [:])
            .responseJSON { (response) in
                if let value = response.result.value {
                    let json = JSON(value)
                    let version = json["results"][0]["version"].stringValue
                    let namereleaseNotes = json["results"][0]["releaseNotes"].stringValue
                    self.compareVersion(appStoreVersion: version, namereleaseNotes: namereleaseNotes)
                }
        }
    }
    
    //比较版本
    func compareVersion(appStoreVersion: String, namereleaseNotes: String) {
        if appStoreVersion.count > 0 {
            let version:String = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
            
            if versionCompare(appStoreVersion: appStoreVersion, currentVersion: version) == 1 {
                let alertView = UIAlertController(title: "有新版本发布啦!", message: namereleaseNotes, preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: { (alert) in
                    
                })
                let doneAction = UIAlertAction(title: "更新", style: .default, handler: { (alert) in
                    let urlString = "itms-apps://itunes.apple.com/app/" + self.appleID
                    if let url = URL(string: urlString) {
                        //根据iOS系统版本，分别处理
                        if #available(iOS 10, *) {
                            UIApplication.shared.open(url, options: [:],
                                                      completionHandler: {
                                                        (success) in
                            })
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                })
                alertView.addAction(cancelAction)
                alertView.addAction(doneAction)
                UIViewController.current()?.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
    func versionCompare(appStoreVersion:String, currentVersion:String) -> Int {
        //判断合法性
        if checkSeparat(vString: appStoreVersion) == "" || checkSeparat(vString: currentVersion) == ""{
            return -1// "只支持 '.''-'/''*'_'作为分隔符"
        }
        //获得两个数组
        let appStoreVersionArray = cutUpNumber(vString: appStoreVersion) as! [String]
        let currentVersionArray = cutUpNumber(vString: currentVersion) as! [String]
        //比较版本号
        return compareNumber(appStoreVersion: appStoreVersionArray, currentVersion: currentVersionArray)
    }
    //提取连接符
    func checkSeparat(vString:String) -> String {
        var separated:String = ""
        if vString.contains("."){ separated = "." }
        if vString.contains("-"){ separated = "-" }
        if vString.contains("/"){ separated = "/" }
        if vString.contains("*"){ separated = "*" }
        if vString.contains("_"){ separated = "_" }
        
        return separated
    }
    //提取版本号
    func cutUpNumber(vString:String) -> NSArray {
        let separat = checkSeparat(vString: vString)
        let b = NSCharacterSet(charactersIn:separat) as CharacterSet
        let vStringArr = vString.components(separatedBy: b)
        return vStringArr as NSArray
    }
    //比较版本
    func compareNumber(appStoreVersion:[String],currentVersion:[String]) -> Int {
        for i in 0..<appStoreVersion.count{
            
            if currentVersion.count <= i{
                return -1
            }
            if Int(appStoreVersion[i])! != Int(currentVersion[i])! {
                if Int(appStoreVersion[i])! > Int(currentVersion[i])! {
                    return 1// "v1 > v2"
                }else{
                    return -1// "v1 < v2"
                }
            }
        }
        return 0// "v1 == v2"
    }
}
