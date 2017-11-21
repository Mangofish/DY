//
//  HomeViewController.swift
//  DY
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 com.wmhVender.WeiMeiHui. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

//    闭包懒加载
    lazy var pageTitleView : PageTitleView = {
        
        let frame = CGRect.init(x: 0, y: 64, width: kScreenWidth, height: kTitleViewH)
        let titiles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView.init(frame: frame, titles: titiles)
        titleView.backgroundColor = UIColor.groupTableViewBackground
        return titleView
    }()
    
    lazy var pageContentView : ContentScrollView = {
        
        let frame = CGRect.init(x: 0, y: kNavHeight+40+kItemBarHeight, width: kScreenWidth, height: kScreenHeight-kNavHeight-44-kTitleViewH-kItemBarHeight)
//        四个控制器
        var childVcs :[UIViewController] = []
        for _ in 0..<4{
            let vc = UIViewController.init()
            childVcs.append(vc)
//            没有隐式转换
            vc.view.backgroundColor = UIColor.init(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
        }
        
        let view = ContentScrollView.init(frame: frame, childVcs: childVcs, parentController: self)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    

}

//设置UI界面
extension HomeViewController {
    
    private func setUpUI() {
        setUpNavBar()
        self.view.addSubview(pageTitleView)
        self.view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
    }
    
//    设置导航
    func setUpNavBar()  {
        
//        左侧
        let leftBtn = UIButton()
        leftBtn.setImage(UIImage.init(named: "logo"), for: .normal)
        leftBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
        
        //        右侧(便利构造方法)
        let item1 = UIBarButtonItem.init(imageName: "image_my_history", hightLightName: "Image_my_history_click", size: CGSize.init(width: 40, height: 40))
        
        let item2 = UIBarButtonItem.init(imageName: "btn_search", hightLightName: "btn_search_clicked", size: CGSize.init(width: 40, height: 40))
        
        let item3 = UIBarButtonItem.init(imageName: "Image_scan", hightLightName: "Image_scan_click", size: CGSize.init(width: 40, height: 40))
        
        navigationItem.rightBarButtonItems = [item1,item2,item3]
        
    }
    
}
