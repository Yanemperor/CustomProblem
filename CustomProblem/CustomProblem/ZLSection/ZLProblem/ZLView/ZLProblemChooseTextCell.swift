//
//  ZLProblemChooseTextCell.swift
//  QuestionBank
//
//  Created by 周子龙 on 2020/1/3.
//  Copyright © 2020 zhouzilong. All rights reserved.
//

import UIKit

class ZLProblemChooseTextCell: UITableViewCell {

    var titleModel: ZLTitleModel? {
        didSet {
            titleLabel.text = titleModel?.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    func initUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(autoSize(number: 10))
            make.left.equalToSuperview().offset(autoSize(number: 15))
            make.right.equalToSuperview().offset(autoSize(number: -15))
            make.bottom.equalToSuperview().offset(autoSize(number: -10))
        }
    }
    
    lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.text = ""
        temp.textColor = color_333333
        temp.textAlignment = .left
        temp.font = autoFont(font: 16)
        temp.numberOfLines = 0
        return temp
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
