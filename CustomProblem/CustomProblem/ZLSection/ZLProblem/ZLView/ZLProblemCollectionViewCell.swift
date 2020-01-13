//
//  ZLProblemCollectionViewCell.swift
//  QuestionBank
//
//  Created by 周子龙 on 2020/1/3.
//  Copyright © 2020 zhouzilong. All rights reserved.
//

import UIKit

class ZLProblemCollectionViewCell: UICollectionViewCell {
    let tableViewRowHeight: CGFloat = 50

    func setTitleModel(titleModel: ZLTitleModel) {
        
        
    }
    
    var titleModel: ZLTitleModel? {
        didSet {
//            options.append(titleModel?.a ?? "")
//            options.append(titleModel?.b ?? "")
//            options.append(titleModel?.c ?? "")
//            options.append(titleModel?.d ?? "")
        }
    }
    
    var options: Array<String> = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    func initUI() {
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        tableView.register(ZLProblemTitleCell.self, forCellReuseIdentifier: "ZLProblemTitleCell")
        tableView.register(ZLProblemChooseTextCell.self, forCellReuseIdentifier: "ZLProblemChooseTextCell")
        tableView.register(ZLProblemOptionsCell.self, forCellReuseIdentifier: "ZLProblemOptionsCell")

        
    }
    
    lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.backgroundColor = UIColor.white
        temp.rowHeight = UITableView.automaticDimension
        temp.estimatedRowHeight = tableViewRowHeight
//        temp.register(ZLTitleTableViewCell.self, forCellReuseIdentifier: "ZLTitleTableViewCell")
        temp.tableFooterView = UIView(frame: CGRect.zero)
        temp.separatorStyle = .none
        temp.dataSource = self
        temp.delegate = self
        return temp
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension ZLProblemCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return options.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: ZLProblemTitleCell = tableView.dequeueReusableCell(withIdentifier: "ZLProblemTitleCell", for: indexPath) as! ZLProblemTitleCell
            cell.selectionStyle = .none
            cell.isSelected = false
            return cell
        }else if indexPath.section == 1 {
            let cell: ZLProblemChooseTextCell = tableView.dequeueReusableCell(withIdentifier: "ZLProblemChooseTextCell", for: indexPath) as! ZLProblemChooseTextCell
            cell.titleModel = titleModel
            cell.selectionStyle = .none
            cell.isSelected = false
            return cell
        }else if indexPath.section == 2 {
            let cell: ZLProblemOptionsCell = tableView.dequeueReusableCell(withIdentifier: "ZLProblemOptionsCell", for: indexPath) as! ZLProblemOptionsCell
            cell.option = options[indexPath.row]
            cell.selectionStyle = .none
            cell.isSelected = false
            return cell
        }
        let cell: ZLProblemOptionsCell = tableView.dequeueReusableCell(withIdentifier: "ZLProblemOptionsCell", for: indexPath) as! ZLProblemOptionsCell
        cell.selectionStyle = .none
        cell.isSelected = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
