//
//  LSStatusRetweetView.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/9.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

class LSStatusRetweetView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        backgroundColor = LSRandomColor()
    }
}
