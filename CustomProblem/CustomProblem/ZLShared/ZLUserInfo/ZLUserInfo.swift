//
//  ZLUserInfo.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/17.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit

class ZLUserInfo: NSObject {

    static var shared = ZLUserInfo()

    // 获取选择的学科
    func getCurrentDiscipline() -> String {
        return UserDefaults.standard.object(forKey: ZLUserDefaultsKey.discipline) as? String ?? "political"
    }
    // 获取选择的学科Name
    func getCurrentDisciplineName() -> String {
        return UserDefaults.standard.object(forKey: ZLUserDefaultsKey.disciplineName) as? String ?? "政治"
    }
    
    func getCurrentExamination() -> String {
        return UserDefaults.standard.object(forKey: ZLUserDefaultsKey.examination) as? String ?? "undergraduate"
    }
    
    func getCurrentExaminationName() -> String {
        return UserDefaults.standard.object(forKey: ZLUserDefaultsKey.examinationName) as? String ?? "专升本"
        
    }
}
