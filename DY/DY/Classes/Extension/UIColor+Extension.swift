//
//  UIColor+Extension.swift
//  DY
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 com.wmhVender.WeiMeiHui. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience  init(r : CGFloat , g : CGFloat , b : CGFloat ) {
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
        
    }
    
}
