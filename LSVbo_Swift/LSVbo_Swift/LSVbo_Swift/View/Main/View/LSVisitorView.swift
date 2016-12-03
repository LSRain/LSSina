//
//  LSVisitorView.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    func setupUI() -> Void {
        addSubview(iconImageView)
        addConsUSLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var iconImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
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
