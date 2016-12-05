//
//  Extension+UIImageView.swift
//  LSVbo_Swift
//
//  Created by WangBiao on 2016/12/3.
//  Copyright © 2016年 lsrain. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView{
    
    /// 快速创建UIImageView
    ///
    /// - Parameter imageName: 图片名称
    convenience init(imageName: String){
        self.init(image: UIImage(named: imageName))
        
    }
    
    /// 封装了`SDWebImage` - ls_setImage
    ///
    /// - Parameters:
    ///   - withURLString: URL
    ///   - placeholderImageName: placeholderImageName
    func ls_setImage(withURLString: String!, placeholderImageName: String!){
        let url = URL(string: withURLString)
        sd_setImage(with: url, placeholderImage: UIImage(named: placeholderImageName))
    }
}
