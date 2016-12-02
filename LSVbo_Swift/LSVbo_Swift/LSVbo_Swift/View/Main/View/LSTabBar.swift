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
     private lazy var composeButton: UIButton = {
        let btn = UIButton(imageName: "tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button", target: self, action: #selector(btnClick))
        return btn
    }()
    
    func btnClick(){
        print("btnClick...")
    }
    
    /// 布局子控件 - compose的frame
     override func layoutSubviews() {
        super.layoutSubviews()
        composeButton.center.x = LSWidth * 0.5
        composeButton.center.y = frame.size.height * 0.5
        var index: CGFloat = 0
        /// 需要修改系统的UITabBarButton的宽
        for btn in subviews {
            let width = LSWidth * 0.2
            if btn.isKind(of: NSClassFromString("UITabBarButton")!){
                btn.frame.size.width = width
                btn.frame.origin.x = index * width
                index += 1
                /// 需要跳过中间的撰写按钮
                if index == 2 {
                    index += 1
                }
            }
        }
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
