//
//  PageTitleView.swift
//  DY
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 com.wmhVender.WeiMeiHui. All rights reserved.
//

import UIKit

//表示只能被类 class
protocol PageTitleViewDelegate : class {
    func pageTiltleDidSelected(titleView : PageTitleView, index selectedIndex : Int) -> Void
}

let kScrollH : CGFloat = 2
class PageTitleView: UIView {

//    定义属性
    private var titles :[String]
//    数组需要初始化
    private var labelAry : [UILabel] = []
//    当前位置
    private var currentIndex : Int = 0
//  滚动ScrollView
    private var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView.init()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
        
    }()
    
//    滚动底部Line
    private var scrollLine : UIView = {
        
        let scrollLine = UIView.init()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
    }()
    
//    初始化构造函数
    init(frame: CGRect, titles : [String]) {
        
        self.titles = titles
        super.init(frame: frame)
//        设置UI
        self.setUpUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView {
    
    private func setUpUI( ){
        
//        1.添加scrollview
        addSubview(scrollView)
        scrollView.frame = bounds
//        2.添加标题
        setUpTitleLables()
//        添加底线
        setUpTitleLine()
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            
        }
    }
    
    private func setUpTitleLables() {
//        既要位置，又要内容
        
        let labW :CGFloat = frame.width/CGFloat(titles.count)
        let labH :CGFloat = frame.height - kScrollH
        let labY :CGFloat = 0
        scrollView.contentSize = CGSize.init(width: Int(labW) * titles.count, height: 40)
        
        for (index, title) in titles.enumerated() {
            
            let lab = UILabel.init()
//            样式设置
            lab.text = title
            lab.tag = index
            lab.font = UIFont.systemFont(ofSize: 16)
            lab.textColor = UIColor.darkGray
            lab.textAlignment = .center
            
//            位置
            let labX :CGFloat = labW * CGFloat(index)
            lab.frame = CGRect.init(x: labX, y: labY, width: labW, height: labH)
            scrollView.addSubview(lab)
            labelAry.append(lab)
            
//            为label添加手势
            lab.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(titleDidClicked(sender:)))
            
            lab.addGestureRecognizer(tap)
        }
        
    }
    
    private func setUpTitleLine() {
        
//        设置位置
//        1.获取label
        guard let firstLabel = labelAry.first else {
            return
        }
        
        //       添加scrollLine
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect.init(x: firstLabel.frame.origin.x, y: frame.height-kScrollH, width: firstLabel.frame.size.width, height: kScrollH)
        firstLabel.textColor = UIColor.orange
    }
    
}

//手势方法，点击事件
extension PageTitleView {
   @objc private func titleDidClicked (sender : UIGestureRecognizer) {
        print("监听")
    if  sender.view?.tag == currentIndex {
        return
    }
//    获取当前Label
    let currentLabel : UILabel = (sender.view as? UILabel)!
    currentLabel.textColor = UIColor.orange
//    获取之前的Label
    let oldLabel = self.labelAry[currentIndex]
//    改变颜色
    oldLabel.textColor = UIColor.darkGray
    currentIndex = currentLabel.tag
//    改变滑动条位置
    let scrollViewX = CGFloat(currentLabel.tag) * scrollLine.frame.width
    UIView.animate(withDuration: 0.5) {
        self.scrollLine.frame.origin.x = scrollViewX
    }
    
    }
    
}

