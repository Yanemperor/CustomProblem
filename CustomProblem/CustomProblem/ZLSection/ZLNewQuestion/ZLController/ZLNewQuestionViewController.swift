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
        addKeyboardNotification()
        
        view.addSubview(toolbar)
    }
    
    // MARK: - View(页面处理)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        IQKeyboardManager.shared.enableAutoToolbar = true
    }
    
    override func keyboardWillShow(aNotification: Notification) {
        //得到键盘frame
        let userInfo: NSDictionary = aNotification.userInfo! as NSDictionary
        let value = userInfo.object(forKey: UIResponder.keyboardFrameEndUserInfoKey)
        let keyboardRec = (value as AnyObject).cgRectValue
        let height = keyboardRec?.size.height
        //位置在键盘顶部
        self.toolbar.origin = CGPoint(x: 0, y: kScreenHeight - height! - autoSize(number: 160))
    }
    
//    override func keyboardDidHide(aNotification: Notification) {
//        UITextView.animate(withDuration: 0.1, animations: {
//            self.toolbar.origin = CGPoint(x: 0, y: kScreenHeight)
//        })
//    }
    
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    
    
    // MARK: - loading
    
    
    // MARK: - 懒加载
    lazy var vm: ZLNewQuestionViewModel = ZLNewQuestionViewModel()

    lazy var toolbar: ZLKeyboardToolbar = {
        let temp = ZLKeyboardToolbar()
        temp.textBlock = { text in
            self.tempTextField?.text = text
        }
        return temp
    }()
    
    var tempTextField: UITextField?

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
        if title == "试卷名" {
//            self.textView.becomeFirstResponder()
//            cell.textField.becomeFirstResponder()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell: ZLNewQuestionCell = tableView.cellForRow(at: indexPath) as! ZLNewQuestionCell
        tempTextField = cell.textField
        self.toolbar.textView.text = tempTextField?.text
        self.toolbar.textView.becomeFirstResponder()
    }
}
