//
//  LSDiscoverViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/2.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSDiscoverViewController: LSVisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if !isLogin {
            visitorView?.setupVisitroViewInfo(imageName: "tabbar_discover", title: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
            return
        }
        loadData()
    }
    
    /// 数据请求
    private func loadData(){
        
    }


}
