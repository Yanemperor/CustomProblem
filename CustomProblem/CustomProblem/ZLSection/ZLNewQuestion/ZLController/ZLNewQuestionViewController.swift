//
//  ZLNewQuestionViewController.swift
//  CustomProblem
//
//  Created by 周子龙 on 2020/1/8.
//  Copyright © 2020 zhouzilong. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class ZLNewQuestionViewController: ZLBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        navTitle(title: "新建题库")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = autoSize(number: 50)
        tableView.register(ZLNewQuestionCell.self, forCellReuseIdentifier: "ZLNewQuestionCell")
        addNextBut(title: "添加题目") {
            let vc = ZLAddTitleViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - View(页面处理)

    
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    
    
    // MARK: - loading
    
    
    // MARK: - 懒加载
    lazy var vm: ZLNewQuestionViewModel = ZLNewQuestionViewModel()
}

extension ZLNewQuestionViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return vm.titles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.titles[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title: String = vm.titles[indexPath.section][indexPath.row]
        
        let cell: ZLNewQuestionCell = tableView.dequeueReusableCell(withIdentifier: "ZLNewQuestionCell", for: indexPath) as! ZLNewQuestionCell
        cell.title = title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
