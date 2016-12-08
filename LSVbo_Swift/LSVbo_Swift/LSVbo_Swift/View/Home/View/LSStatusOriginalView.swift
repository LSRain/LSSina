//
//  LSStatusOriginalView.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/8.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

/// `原创微博`视图
class LSStatusOriginalView: UIView {
    
    var statusViewModel: LSStatusViewModel?{
        didSet{
            iconImageView.ls_setImage(withURLString: statusViewModel?.statusModel?.user?.profile_image_url, placeholderImageName: "avatar_default")
            nameLable.text = statusViewModel?.statusModel?.user?.name
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = LSRandomColor()
        addSubview(iconImageView)
        addSubview(nameLable)
        addSubview(membershipImageView)
        addSubview(timeLable)
        addSubview(sourceLable)
        addSubview(avatarImageView)
        
        iconImageView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 35, height: 35))
            make.left.top.equalTo(10)
        }
        nameLable.snp_makeConstraints { (make) in
            make.top.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp_right).offset(10)
        }
        membershipImageView.snp_makeConstraints { (make) in
            make.left.equalTo(nameLable.snp_right).offset(10)
            make.centerY.equalTo(nameLable)
        }
        timeLable.snp_makeConstraints { (make) in
            make.left.equalTo(nameLable.snp_left)
            make.bottom.equalTo(iconImageView)
        }
        sourceLable.snp_makeConstraints { (make) in
            make.centerY.equalTo(timeLable)
            make.left.equalTo(timeLable.snp_right).offset(10)
        }
        avatarImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(iconImageView.snp_right)
            make.centerY.equalTo(iconImageView.snp_bottom)
        }
    }
    
    private lazy var iconImageView: UIImageView = UIImageView(imageName: "avatar_default")
    /// 昵称
    private lazy var nameLable: UILabel = UILabel(text: "LS.R", fontSize: LSFontNormalSize, textColor: UIColor.blue)
    /// 等级
    private lazy var membershipImageView: UIImageView = UIImageView(imageName: "common_icon_membership")
    private lazy var timeLable: UILabel = UILabel(text: "时间", fontSize: LSFontSmallSize, textColor: LSThemeColor)
    private lazy var sourceLable: UILabel = UILabel(text: "LSSina", fontSize: LSFontSmallSize, textColor: LSThemeColor)
    /// 认证
    private lazy var avatarImageView: UIImageView = UIImageView(imageName: "avatar_vgirl")
    
}
