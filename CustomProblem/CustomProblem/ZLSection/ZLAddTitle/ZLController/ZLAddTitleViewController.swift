//
//  ZLAddTitleViewController.swift
//  CustomProblem
//
//  Created by 周子龙 on 2020/1/13.
//  Copyright © 2020 zhouzilong. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class ZLAddTitleViewController: ZLBaseTableViewController {

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
        lazy var vm: ZLAddTitleViewModel = ZLAddTitleViewModel()

        lazy var toolbar: ZLKeyboardToolbar = {
            let temp = ZLKeyboardToolbar()
            temp.textBlock = { text in
                self.tempTextField?.text = text
            }
            return temp
        }()
        
        var tempTextField: UITextField?
        
        lazy var addOptionsBtn: UIButton = {
            let temp = UIButton(frame: CGRect(x: autoSize(number: 15), y: autoSize(number: 10), width: kScreenWidth - autoSize(number: 30), height: autoSize(number: 30)))
            temp.backgroundColor = color_ffffff
            temp.setTitle("添加新的选项", for: .normal)
            temp.setTitleColor(color_333333, for: .normal)
            temp.titleLabel?.font = autoFont(font: 16)
    //        temp.setImage(UIImage(named: "item_del"), for: .normal)
            temp.layer.cornerRadius = 8
            temp.layer.masksToBounds = true
            temp.layer.borderWidth = 1
            temp.layer.borderColor = color_333333.cgColor
            temp.rx.controlEvent(.touchUpInside).subscribe { (button) in
                self.vm.titles[1].append("")
                self.tableView.reloadSections(IndexSet(arrayLiteral: 1), with: .none)
            }.disposed(by: disposeBag)
            return temp
        }()

}

extension ZLAddTitleViewController {
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
        if indexPath.section == 1 {
            if indexPath.row < 26 {
                cell.title = vm.alphabet[indexPath.row]
            }
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
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            let bgView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: autoSize(number: 50)))
            bgView.backgroundColor = color_ffffff
            bgView.addSubview(addOptionsBtn)
            return bgView
        }
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kCGFloat_min))
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return autoSize(number: 50)
        }
        return kCGFloat_min
    }
    
    // 左滑删除
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        if indexPath.section == 1 {
            return true
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?{
            return "删除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if self.vm.titles[1].count <= 2 {
                ZLHUD.show(text: "选项最少为两个", type: .failure)
                return
            }
            self.vm.titles[1].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }
}
