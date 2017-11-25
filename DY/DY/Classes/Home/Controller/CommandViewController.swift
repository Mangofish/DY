//
//  CommandViewController.swift
//  DY
//
//  Created by apple on 2017/11/24.
//  Copyright © 2017年 com.wmhVender.WeiMeiHui. All rights reserved.
//

import UIKit

private let kImgMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenWidth - 3 * kImgMargin) / 2
private let kItemH : CGFloat = kItemW * 3 / 4

class CommandViewController: UIViewController ,UICollectionViewDataSource {

    private lazy var collectionView : UICollectionView = { [unowned self] in
//            创建布局
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: kItemW, height: kItemH)
        layout.minimumInteritemSpacing = kImgMargin
        layout.minimumLineSpacing = 0
//        创建UIcollection
        let collectionView = UICollectionView.init(frame:self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()

    }

}

extension CommandViewController {
    
    private func setUpUI () {
        self.view.addSubview(collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//
//
//    }
    
}



