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
        contentView.addSubview(statusBottomView)
        
        originalView.snp_makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
        }
        statusBottomView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(contentView)
            make.height.equalTo(35)
        }
    }
    
    /// 原创微博
    private lazy var originalView: LSStatusOriginalView = LSStatusOriginalView()
    /// 底部视图
    private lazy var statusBottomView: LSStatusBottomView = LSStatusBottomView()
}
