//
//  LSTempViewController.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSTempViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() -> Void {
        view.backgroundColor = UIColor.white
        setNav()
    }
    
    func setNav(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "PUSH", target: self, action: #selector(pushClick))
    }

    func pushClick(){
        
    }
}
