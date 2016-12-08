//
//  LSStatusBottomView.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/9.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSStatusBottomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        backgroundColor = LSRandomColor()
        let retweetButton = addChildView(imageName: "timeline_icon_retweet", backgroundImageName: "timeline_retweet_background", title: "转发")
        let commentButton = addChildView(imageName: "timeline_icon_comment", backgroundImageName: "timeline_retweet_background", title: "评论")
        let unlikButton = addChildView(imageName: "timeline_icon_unlike",  backgroundImageName: "timeline_retweet_background", title: "赞")
        /// 分割竖线
        let lineViewOne = addLineView()
        let lineViewTwo = addLineView()
        
        retweetButton.snp_makeConstraints { (make) in
            make.left.bottom.top.equalTo(self)
            make.width.equalTo(commentButton)
        }
        commentButton.snp_makeConstraints { (make) in
            make.left.equalTo(retweetButton.snp_right)
            make.top.bottom.equalTo(self)
            make.width.equalTo(unlikButton)
        }
        unlikButton.snp_makeConstraints { (make) in
            make.left.equalTo(commentButton.snp_right)
            make.top.bottom.right.equalTo(self)
        }
        lineViewOne.snp_makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.centerX.equalTo(retweetButton.snp_right)
        }
        lineViewTwo.snp_makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.centerX.equalTo(commentButton.snp_right)
        }
    }
    
    /// 添加子控件
    ///
    /// - Parameters:
    ///   - imageName: 按钮图片名称
    ///   - backgroundImageName: 按钮背景图片名称
    ///   - title: 按钮标题
    /// - Returns: 设置好的按钮
    func addChildView(imageName: String, backgroundImageName: String, title: String) -> UIButton {
        let button = UIButton(imageName: imageName, backgroundImageName: backgroundImageName, title: title, target: self, action: #selector(buttonClick))
        addSubview(button)
        return button
    }
    
    /// 添加分割竖线
    ///
    /// - Returns: 设置好的竖线view
    func addLineView() -> UIImageView {
        let lineView = UIImageView(imageName: "timeline_card_bottom_line")
        addSubview(lineView)
        return lineView
    }
    
    @objc private func buttonClick(){
        print("buttonClick..")
    }
}
