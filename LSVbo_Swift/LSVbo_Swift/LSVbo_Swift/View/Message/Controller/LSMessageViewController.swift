//
//  LSMessageViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSMessageViewController: LSVisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if !isLogin {
            visitorView?.setupVisitroViewInfo(imageName: "visitordiscover_image_message", title: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
            return
        }
        loadData()
    }
    
    /// 数据请求
    private func loadData(){
    
    }
}
