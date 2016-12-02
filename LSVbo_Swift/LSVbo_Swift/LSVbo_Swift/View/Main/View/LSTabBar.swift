//
//  LSTabBar.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSTabBar: UITabBar {

    /// 懒加载撰写按钮 - 提高性能
     lazy var composeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        btn.sizeToFit()
        return btn
    }()
    
    /// 布局子控件 - compose的frame
    override func layoutSubviews() {
        super.layoutSubviews()
        composeButton.center.x = frame.size.width * 0.5
        composeButton.center.y = frame.size.height * 0.5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        /// 在这里也调用setupUI()目的是如果使用xib价值，那么同样是可以被调用的
//        setupUI()
    }
    
    private func setupUI(){
        addSubview(composeButton)
    }
    

}
