//
//  ZLDataBase.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/10/11.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import Foundation
import WCDBSwift

class ZLDataBase {
    static let shared = ZLDataBase()
    
    var dataBase: Database?
    
    private init() { }
    
    func createDB() {
        let dataBase = Database(withPath: self.getDBPath())
        if dataBase.canOpen {
            print("####数据库创建成功####")
            self.dataBase = dataBase
            createTable()
        }else{
            print("####数据库创建失败####")
        }
        print(self.getDBPath())
    }
    
    // 数据库创建成功创建表
    func createTable() {
        // 转盘项DB
//        createCircularTable()
    }
    
    /// 获取数据库路径
    func getDBPath() -> String {
        let path: Array = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return path[0] + "/WCDB" + "/zldb.db"
    }
    
    // 删除表数据
    func deleteTable(name: String) -> Bool {
        do {
            try dataBase?.delete(fromTable: name)
            return true
        } catch {
            print("####\(name)表删除失败####")
            return false
        }
    }
}

//
extension ZLDataBase {
//    func createCircularTable() {
//        do {
//            try dataBase?.create(table: ZLTableKey.circularTable, of: ZLCircularModel.self)
//        } catch {
//            print("####转盘题库创建成功####")
//        }
//    }
//
//    func insertCircularTable(array: Array<ZLCircularModel>) {
//        do {
//            try dataBase?.insert(objects: array, intoTable: ZLTableKey.circularTable)
//        } catch {
//            print("####转盘表插入失败####")
//        }
//    }
//
//    func insertOrReplaceCircularTable(model: ZLCircularModel) {
//        do {
//            try dataBase?.insertOrReplace(objects: model, intoTable: ZLTableKey.circularTable)
//        } catch {
//            print("####转盘表插入失败####")
//        }
//    }
//
//    func updateCircularTable(model: ZLCircularModel) {
//        do {
////            try dataBase?.update(table: ZLTableKey.circularTable, on: ZLCircularModel.Properties.id, with: model)
//            try dataBase?.update(table: ZLTableKey.circularTable, on: ZLCircularModel.Properties.id, with: model, where: ZLCircularModel.Properties.id == model.id)
//        } catch {
//            print("####转盘表更新数据失败####")
//        }
//    }
//
//    func deleteCircularTable(model: ZLCircularModel) {
//        do {
//            try dataBase?.delete(fromTable: ZLTableKey.circularTable,
//                                 where: ZLCircularModel.Properties.id == model.id)
//
//        } catch {
//            print("####转盘表删除失败####")
//        }
//    }
//
//    func getCircularTable(id: Int) -> ZLCircularModel? {
//        do {
//            return try dataBase?.getObject(on: ZLCircularModel.CodingKeys.all, fromTable: ZLTableKey.circularTable, where: ZLCircularModel.Properties.id == id)
//        } catch {
//            return nil
//        }
//    }
//
//    func deleteAllDataPoliticalTable() {
//        do {
//            try dataBase?.delete(fromTable: ZLTableKey.circularTable)
//        } catch {
//            print("####转盘表删除所有数据失败####")
//        }
//    }
//
//    func getCircularTable() -> Array<ZLCircularModel>? {
//        do {
//            return try dataBase?.getObjects(on: ZLCircularModel.CodingKeys.all, fromTable: ZLTableKey.circularTable) ?? []
//            } catch {
//            print("####转盘数据获取失败####")
//                return nil
//            }
//    }
    
}
