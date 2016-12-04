//
//  LSOAuthViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/4.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSOAuthViewController: UIViewController {
    
    override func loadView() {
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        
        view.backgroundColor = UIColor.white
        setupNav()
    }
    
    private func setupNav(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", target: self, action: #selector(cancelClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", target: self, action: #selector(autoFillClick))
        navigationItem.title = "微博登录"
    }
    
    /// WebView
    private lazy var webView: UIWebView = {
       
        let url = URL(string: "\(LSOAuthURL)?client_id=\(LSClient_id)&redirect_uri=\(LSRedirect)")
        let request = URLRequest(url: url!)
        let view = UIWebView()
        view.loadRequest(request)
        view.delegate = self
        return view
    }()
    
    @objc private func cancelClick(){
        dismiss(animated: true, completion: nil)
    }
    
    /// 自动填充 - 使用前 需要在公用文件中配置好正确的用户名和密码
    @objc private func autoFillClick(){
        /// JS注入
        let jsString = "document.getElementById('userId').value='\(LSWBUserId)',document.getElementById('passwd').value='\(LSWBPasswd)'"
        webView.stringByEvaluatingJavaScript(from: jsString)
    }
}

/// extension - webView代理
extension LSOAuthViewController: UIWebViewDelegate{
    
    /// webView代理方法 - 主要用来获取code
    ///
    /// - Parameters:
    ///   - webView: webView
    ///   - request: 请求
    ///   - navigationType: navigationType
    /// - Returns: 默认返回`true`
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let URLString = request.url?.absoluteString
        if let u = URLString, u.hasPrefix(LSRedirect) {
            let query = request.url?.query
            let code = query?.substring(from: "code=".endIndex) ?? ""
            print("code = \(code)")
        }
        return true
    }
}
