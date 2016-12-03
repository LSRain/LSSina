//
//  Extension+UIImageView.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit

extension UIImageView{
    
    /// 快速创建UIImageView
    ///
    /// - Parameter imageName: 图片名称
    convenience init(imageName: String){
        self.init(image: UIImage(named: imageName))
        
    }
}
