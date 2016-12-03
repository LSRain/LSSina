//
//  LSProfileViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSProfileViewController: LSVisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if !isLogin {
            visitorView?.setupVisitroViewInfo(imageName: "visitordiscover_image_profile", title: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
            return
        }
        loadData()
    }
    
    /// 数据请求
    private func loadData(){
        
    }
}
