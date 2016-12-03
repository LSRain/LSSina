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
    
    override func loadView() {
        if isLogin {
            super.loadView()
        } else{
            setupVisitView()
        }
    }
    
    private func setupVisitView(){
        let visitView = LSVisitorView()
        visitView.backgroundColor = UIColor(white: 237/255, alpha: 1)
        view = visitView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
