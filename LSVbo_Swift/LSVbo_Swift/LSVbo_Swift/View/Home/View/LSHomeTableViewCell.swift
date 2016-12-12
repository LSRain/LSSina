//
//  LSHomeTableViewCell.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/7.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSHomeTableViewCell: UITableViewCell {
    
    /// 约束记录
    var bottomViewConstraint: Constraint?
    var statusViewModel: LSStatusViewModel?{
        didSet{
            originalView.statusViewModel = statusViewModel
            self.bottomViewConstraint?.uninstall()
            if statusViewModel?.statusModel?.retweeted_status == nil {
                statusBottomView.snp_updateConstraints(closure: { (make) in
                    self.bottomViewConstraint = make.top.equalTo(originalView.snp_bottom).constraint
                })
                statusRetweetView.isHidden = true
            }else {
                statusBottomView.snp_updateConstraints(closure: { (make) in
                    self.bottomViewConstraint = make.top.equalTo(statusRetweetView.snp_bottom).constraint
                })
                statusRetweetView.isHidden = false
            }
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
        contentView.addSubview(statusRetweetView)
        contentView.addSubview(statusBottomView)
        
        originalView.snp_makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
        }
        statusRetweetView.snp_makeConstraints { (make) in
            make.top.equalTo(originalView.snp_bottom)
            make.left.right.equalTo(originalView)
            make.height.equalTo(35)
        }
        statusBottomView.snp_makeConstraints { (make) in
            self.bottomViewConstraint = make.top.equalTo(statusRetweetView.snp_bottom).constraint
            make.left.bottom.right.equalTo(contentView)
            make.height.equalTo(35)
        }
        
    }
    
    /// 原创微博
    private lazy var originalView: LSStatusOriginalView = LSStatusOriginalView()
    /// 底部视图
    private lazy var statusBottomView: LSStatusBottomView = LSStatusBottomView()
    /// 转发微博
    private lazy var statusRetweetView: LSStatusRetweetView = LSStatusRetweetView()
}
