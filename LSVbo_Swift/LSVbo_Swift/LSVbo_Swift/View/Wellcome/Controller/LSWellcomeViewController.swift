//
//  LSWellcomeViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/6.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSWellcomeViewController: UIViewController {

    override func loadView() {
        view = bgView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(iconView)
        view.addSubview(messageLabel)
        /// icon - 头像
        iconView.snp_makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 90, height: 90))
            make.top.equalTo(view).offset(400)
        }
        /// messageLabel
        messageLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(iconView.snp_bottom).offset(16)
        }
    }
    
    /// backgroundView
    private lazy var bgView: UIImageView = {
        let view = UIImageView(imageName: "ad_background")
        return view
    }()

    /// icon
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        /// layer setting
        view.layer.borderColor = LSThemeColor.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 45
        view.ls_setImage(withURLString: LSUserAccountViewModel.sharedAccount.userAccount?.profile_image_url, placeholderImageName: "avatar_default")
        /// 设置圆图
        view.layer.masksToBounds = true
        return view
    }()
    
    /// message
    private lazy var messageLabel: UILabel = {
        let lab = UILabel(text: "欢迎回来", fontSize: 18, textColor: LSThemeColor)
        return lab
    }()
}
