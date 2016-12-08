//
//  LSHomeTableViewCell.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/7.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSHomeTableViewCell: UITableViewCell {
    
    var statusViewModel: LSStatusViewModel?{
        didSet{
            originalView.statusViewModel = statusViewModel
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(){
        backgroundColor = LSRandomColor()
        contentView.addSubview(originalView)
        originalView.snp_makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
            make.height.equalTo(100)
        }
    }
    
    /// 原创微博
    private lazy var originalView: LSStatusOriginalView = LSStatusOriginalView()
}
