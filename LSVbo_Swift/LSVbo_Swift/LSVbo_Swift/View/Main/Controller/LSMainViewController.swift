//
//  LSMainViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSMainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
      
        /// 添加子控制器
        addChildViewController(vc: LSHomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(vc: LSMessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(vc: LSDiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(vc: LSMessageViewController(), title: "我", imageName: "tabbar_profile")
        
        /// 使用自定义的tabBar
        let tab = LSTabBar()
        setValue(tab, forKey: "tabBar")
        /// 实例化闭包
        tab.closure = {
            print("主控制器监听到撰写按钮点击")
        }
    }
    
    /// 设置子控制器
    ///
    /// - Parameters:
    ///   - vc: 目标控制器
    ///   - title: 控制器title
    ///   - imageName: tabBarItem图片名
    private func addChildViewController(vc: UIViewController, title: NSString, imageName: NSString) {
        vc.title = title as String
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : LSThemeColor], for: UIControlState.selected)
        vc.tabBarItem.image = UIImage(named: imageName as String)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: imageName.appending("_selected"))?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
    }

}
