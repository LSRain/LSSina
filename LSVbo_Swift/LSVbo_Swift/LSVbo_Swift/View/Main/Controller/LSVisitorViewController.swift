//
//  LSVisitorViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSVisitorViewController: UIViewController {

    let isLogin: Bool = false
    var visitorView: LSVisitorView?
    
    override func loadView() {
        if isLogin {
            super.loadView()
        } else{
            setupVisitView()
        }
    }
    
    private func setupVisitView(){
        visitorView = LSVisitorView()
        visitorView?.backgroundColor = UIColor(white: 237/255, alpha: 1)
        setupNav()
        /// 实例化访客视图的`closure`
        visitorView?.closure = {[weak self] in
            self?.loginClick()
        }
        view = visitorView
    }
    
    /// 访客视图导航 `注册`、`登录`
    private func setupNav(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", target: self, action: #selector(loginClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", target: self, action: #selector(loginClick))
    }
    
    @objc private func loginClick(){
        print("访客视图Nav click")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
