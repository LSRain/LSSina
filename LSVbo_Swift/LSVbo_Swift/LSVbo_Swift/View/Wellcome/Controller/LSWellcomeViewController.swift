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
    
    /// 控件加载完成 - 生命周期 设置阻尼动画
    override func viewDidAppear(_ animated: Bool) {
        iconView.snp_updateConstraints { (make) in
            make.top.equalTo(view).offset(100)
        }
        /// 阻尼动画
        /// - withDuration: 动画时长
        /// - delay: 延迟时间
        /// - usingSpringWithDamping: 阻尼系数 - 系数越小 弹性越大
        /// - initialSpringVelocity: 起始加速度
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
            /// 头像动画完成 - 显示lab
            UIView.animate(withDuration: 0.25, animations: {
                self.messageLabel.alpha = 1
            }, completion: { (_) in
              /// 动画展示完成后发送通知 - 切换到首页控制器 `已登录`
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: LSSWITCHROOTVCNOTI), object: "welcome")
            })
        }
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
        lab.alpha = 0
        return lab
    }()
}
