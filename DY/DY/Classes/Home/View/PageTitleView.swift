//
//  PageTitleView.swift
//  DY
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 com.wmhVender.WeiMeiHui. All rights reserved.
//

import UIKit

class PageTitleView: UIView {

//    定义属性
    private var titles :[String]
    
    private var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView.init()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
        
    }()
//    初始化构造函数
    init(frame: CGRect, titles : [String]) {
        
        self.titles = titles
        super.init(frame: frame)
        self.setUpUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView {
    
    private func setUpUI( ){
        
        addSubview(scrollView)
        scrollView.frame = bounds
        
    }
    
    private func setUpTitleLables() {
//        既要位置，又要内容
        for (index, title) in titles.enumerated() {
            
            let lab = UILabel.init()
            
//            样式设置
            lab.text = title
            lab.tag = index
            lab.font = UIFont.systemFont(ofSize: 16)
            lab.textColor = UIColor.darkGray
            lab.textAlignment = .center
            
            let labW :CGFloat = 0
            let labH :CGFloat = 0
            let labX :CGFloat = 0
            let labY :CGFloat = 0
            
        }
        
    }
    
}
