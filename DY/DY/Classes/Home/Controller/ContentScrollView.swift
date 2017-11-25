//
//  ContentScrollView.swift
//  DY
//
//  Created by apple on 2017/11/20.
//  Copyright © 2017年 com.wmhVender.WeiMeiHui. All rights reserved.
//

import UIKit

private let contentCellID = "contentCellID"

protocol ContentScrollViewDelegate : class {
    func contenViewDidScrollToIndex(index : Int)
}

class ContentScrollView: UIView ,UICollectionViewDataSource,UICollectionViewDelegate {

//    定义属性
    private var childVCs : [UIViewController]
    private weak var parentVC : UIViewController?
    private var startContentOffsetX : CGFloat = 0
    
   weak var contentDelegate : ContentScrollViewDelegate?
    
    lazy var collectionView : UICollectionView = {
//        1.创建layout
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = (self.bounds.size)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
//        2.创建collection
        let  collectionview = UICollectionView.init(frame: CGRect.init(), collectionViewLayout: layout)
        collectionview.isPagingEnabled = true
        collectionview.bounces = false
        collectionview.dataSource = self
        collectionview.showsVerticalScrollIndicator = false
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.delegate = self
//        .self拿到类型
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellID)
        return collectionview
        
    }()
    
//   自定义初始化构造方法
    init(frame: CGRect, childVcs : [UIViewController], parentController : UIViewController) {
        
        self.childVCs = childVcs
        self.parentVC = parentController
//   界面
        super.init(frame: frame)
        self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//设置UI界面

extension ContentScrollView{
    
    private func setUpUI(){
//        子控制器添加到父控制器
        for child in childVCs {
            parentVC?.addChildViewController(child)
        }
        
        self.addSubview(collectionView)
        collectionView.frame = bounds
        
    }
    
}

extension ContentScrollView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellID, for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childvc = childVCs[indexPath.item]
        childvc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childvc.view)
        
        return cell
    }
    
//    滑动方法
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let newIndex = Int(scrollView.contentOffset.x/scrollView.bounds.width)
//        通知刷新
        self.contentDelegate?.contenViewDidScrollToIndex(index: newIndex)
        
    }
   
    
}

//对外方法
extension  ContentScrollView {
    func setCurrentContentViewIndex(currentIndex : Int) -> Void {
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: true)
    }
}
