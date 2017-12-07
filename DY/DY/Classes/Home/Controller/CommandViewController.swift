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
private let kPrettyItemH : CGFloat = kItemW * 4 / 3

private let kItemHeader : CGFloat = 50

private let normalCellID : String = "NormalCellID"
private let prettyCellID : String = "PrettyCellID"
private let headerID : String = "headerID"

class CommandViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    private lazy var collectionView : UICollectionView = { [unowned self] in
//            创建布局
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: kItemW, height: kItemH)
        layout.minimumInteritemSpacing = kImgMargin
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.headerReferenceSize = CGSize.init(width: kScreenWidth, height: kItemHeader)
//        创建UIcollection
        let collectionView = UICollectionView.init(frame:CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-(kNavHeight+kItemBarHeight+44+44)), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.register(UINib.init(nibName: "RecommandBeautyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: normalCellID)
        collectionView.register(UINib.init(nibName: "PrettyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: prettyCellID)
        
        
//        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        
        collectionView.register(UINib.init(nibName: "RecommandHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        self.setUpUI()

    }

}

extension CommandViewController {
    
    private func setUpUI () {
        self.view.addSubview(collectionView)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 8
        }
        
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell
//        获取cell
        if indexPath.section == 1 {
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: prettyCellID, for: indexPath)
        }else{
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: normalCellID, for: indexPath)
        }
        
        
        return cell

    }
    
//    头样式
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize.init(width: kItemW, height: kPrettyItemH)
        }
        
        return CGSize.init(width: kItemW, height: kItemH)
    }
    
}



