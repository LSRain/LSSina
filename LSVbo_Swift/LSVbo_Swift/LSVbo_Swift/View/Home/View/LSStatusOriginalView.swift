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
            membershipImageView.image = statusViewModel?.mbRankImage
            avatarImageView.image = statusViewModel?.verifiedImage
            contentText.text = statusViewModel?.statusModel?.text
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
        addSubview(contentText)
        
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
        contentText.snp_makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp_bottom).offset(10)
            make.left.equalTo(iconImageView)
        }
        /// 为了增强可读性 - `原创微博视图`的底部约束在这里使用self约束 也可以用`内容`约束
        self.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentText).offset(10)
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
    private lazy var contentText: UILabel = UILabel(text: "Hi, i'm Ls.R; Hi, i'm Ls.R; Hi, i'm Ls.R; Hi, i'm Ls.R; Hi, i'm Ls.R; Hi, i'm Ls.R; Hi, i'm Ls.R; Hi, i'm Ls.R; ", fontSize: LSFontNormalSize, textColor: UIColor.black, maxWidth: LSWidth - 20)
}
