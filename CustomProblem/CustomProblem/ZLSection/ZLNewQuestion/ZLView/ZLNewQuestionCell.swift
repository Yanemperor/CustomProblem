//
//  ZLNewQuestionCell.swift
//  CustomProblem
//
//  Created by 周子龙 on 2020/1/8.
//  Copyright © 2020 zhouzilong. All rights reserved.
//

import UIKit

class ZLNewQuestionCell: BaseTableViewCell {

    var title: String? {
        didSet{
            titleLabel.text = title
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    func initUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(autoSize(number: 15))
            make.top.equalToSuperview().offset(autoSize(number: 10))
            make.bottom.equalToSuperview().offset(autoSize(number: -10))
        }
        textField.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(autoSize(number: -15))
            make.top.equalToSuperview().offset(autoSize(number: 5))
            make.bottom.equalToSuperview().offset(autoSize(number: -5))
            make.left.greaterThanOrEqualTo(titleLabel.snp.right).offset(autoSize(number: 20))
            make.width.greaterThanOrEqualTo(autoSize(number: 200))
        }
    }
    
    lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.text = ""
        temp.textColor = color_333333
        temp.textAlignment = .left
        temp.font = autoFont(font: 16)
        return temp
    }()
    
    lazy var textField: UITextField = {
        let temp = UITextField()
        temp.textColor = color_666666
        temp.textAlignment = .right
        temp.font = autoFont(font: 16)
        temp.placeholder = "请输入"
//        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
