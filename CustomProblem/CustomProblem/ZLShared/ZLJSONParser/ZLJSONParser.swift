//
//  ZLJSONParser.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/9/30.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit

class ZLJSONParser: NSObject {
    static var shared = ZLJSONParser()
    
    func dataToJSONString(data: Data) -> String? {
        //只要符合String.Encoding.utf8这种编码的data都能转化成功
        let jsonString =  NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        return jsonString as String?
    }
    
    func dataToDic(data: Data) -> Dictionary<String, AnyObject>? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let dic = json as! Dictionary<String, AnyObject>
            return dic
        }catch{
            print("data=》dic 数据解析失败")
            return nil
        }
    }
    
    func dataToArray(data: Data) -> Array<Dictionary<String, Any>>? {
        do {
            let array = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            return array as? Array
        }catch{
            return nil
        }
    }
    
    func stringValueDic(_ str: String) -> [String : Any]?{
        let data = str.data(using: String.Encoding.utf8)
        if let dict = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any] {
            return dict
        }
        return nil
    }
}
