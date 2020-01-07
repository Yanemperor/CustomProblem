//
//  ZLTableKey.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/11.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation

//
struct ZLTableKey {
    static let circularTable = "CircularTable"        // 转盘数据表
    static let politicalWrongTable = "PoliticalWrongTable"        // 大学政治错题数据表
}

struct ZLUserDefaultsKey {
    static let discipline = "Discipline"                // 学科
    static let disciplineName = "DisciplineName"                // 学科Name
    static let examination = "Examination"                // 考试类型: 专升本\高起专
    static let examinationName = "ExaminationName"                // 考试类型: 专升本\高起专

}


struct ZLAppConfigKey {
    static let buglyID = "3cf4f02947"                // Bugly APPID
    static let isUpDB = "isUpDB"                    // 是否更新数据库
    static let currentVersion = "currentVersion"                    // 当前版本号
}
