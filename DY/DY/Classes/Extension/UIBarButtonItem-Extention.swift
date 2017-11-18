//
//  UIBarButtonItem-Extention.swift
//  DY
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 com.wmhVender.WeiMeiHui. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    /*类方法
    class func createItem(imageName : String, hightLightName : String , size : CGSize){
        
    }
    */
//    1.convenience 2.调用设计函数(self)
//    便利构造方法
    convenience init(imageName : String, hightLightName : String = "", size : CGSize = CGSize.init(width: 0, height: 0)) {
        
        let rightBtn1 = UIButton()
        rightBtn1.setImage(UIImage.init(named: imageName), for: .normal)
        rightBtn1.setImage(UIImage.init(named: hightLightName), for: .highlighted)
        rightBtn1.sizeToFit()
        self.init(customView: rightBtn1)
        
    }
}
