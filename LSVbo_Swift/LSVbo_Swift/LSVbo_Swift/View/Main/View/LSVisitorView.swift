//
//  LSVisitorView.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSVisitorView: UIView {
    
    /// 定义闭包 - 用以回传按钮点击事件
    var closure:(()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    /// 根据外界传入的不同参数内容显示不同模块访客视图信息
    func setupVisitroViewInfo(imageName: String?, title: String?) -> Void {
        if let image = imageName, let ltitle = title {
            /// 进入判断域说明是!`首页`
            iconImageView.image = UIImage(named: image)
            messageLabView.text = ltitle
            circleImageView.isHidden = true
        }else{
            setupCicleImageViewAnimation()
        }
    }
    
    /// 设置`首页`的圆圈动画
    private func setupCicleImageViewAnimation(){
        let anim  = CABasicAnimation(keyPath: "transform.rotation")
        /// 旋转角度
        anim.toValue = M_PI * 2
        /// 持续时间 `s`
        anim.duration = 20
        /// 播放次数 - `无限大`
        anim.repeatCount = MAXFLOAT
        /// 注意，需要取消其结束关闭动画选项 - 默认`true`程序挂起动画停止
        anim.isRemovedOnCompletion = false
        /// 添加动画
        circleImageView.layer.add(anim, forKey: nil)
    }

    func setupUI() -> Void {
        addSubview(circleImageView)
        addSubview(maskImageView)
        addSubview(iconImageView)
        addSubview(messageLabView)
        addSubview(rigisterButton)
        addSubview(loginButton)
        
        /// 布局
        circleImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        maskImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        iconImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        messageLabView.snp_makeConstraints { (make) in
            make.top.equalTo(maskImageView.snp_bottom).offset(16)
            make.centerX.equalTo(self)
            make.width.equalTo(230)
        }
        rigisterButton.snp_makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 30))
            make.top.equalTo(messageLabView.snp_bottom).offset(16)
            make.left.equalTo(messageLabView)
        }
        loginButton.snp_makeConstraints { (make) in
            make.size.equalTo(rigisterButton)
            make.centerY.equalTo(rigisterButton)
            make.right.equalTo(messageLabView)
        }
    }
    
    @objc private func loginBtnClick(){
        /// 执行`closure`
        closure!()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ////////////////////////懒加载控件///////////////////////////////////////////////////
    /// 星星圆圈
    fileprivate lazy var circleImageView: UIImageView = UIImageView(imageName: "visitordiscover_feed_image_smallicon")
    /// 蒙层view
    fileprivate lazy var maskImageView: UIImageView = UIImageView(imageName: "visitordiscover_feed_mask_smallicon")
    /// iconImageView
    fileprivate lazy var iconImageView: UIImageView = UIImageView(imageName: "visitordiscover_feed_image_house")
    /// 消息文字
    fileprivate lazy var messageLabView: UILabel = {
        let lab = UILabel(text: "如何让我遇见你，在我最美丽的季节。为这，我已在佛前求了五百年", fontSize: LSFontNormalSize, textColor: UIColor.darkGray)
        lab.textAlignment = .center
        lab.numberOfLines = 0
        return lab
    }()
    /// 注册按钮
    fileprivate lazy var rigisterButton: UIButton = {
        let button = UIButton(backgroundImageName: "common_button_white", title: "注册", target: self, action: #selector(loginBtnClick))
        button.titleLabel?.font = UIFont.systemFont(ofSize: LSFontNormalSize)
        return button
    }()
    /// 登录按钮
    fileprivate lazy var loginButton: UIButton = {
        let button = UIButton(backgroundImageName: "common_button_white", title: "登录", target: self, action: #selector(loginBtnClick))
        button.titleLabel?.font = UIFont.systemFont(ofSize: LSFontNormalSize)
        return button
    }()
}

extension LSVisitorView{
    
    /// 使用原生的`Layout`布局iconImageView
    func addConsUSLayout() -> Void {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        /// - item: 被约束的对象
        /// - attribute: 约束的条件
        /// - relatedBy: 关系
        /// - toItem: 参照物
        /// - attribute: 约束的条件
        /// - multiplier: 倍数
        /// - constant: 差值
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
    }
}
