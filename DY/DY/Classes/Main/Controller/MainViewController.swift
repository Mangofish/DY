//
//  MainViewController.swift
//  DY
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 com.wmhVender.WeiMeiHui. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addController(storyName: "Home")
        self.addController(storyName: "Live")
        self.addController(storyName: "Follow")
        self.addController(storyName: "Mine")
        
    }

    func addController(storyName:String)  {
        
        let  childVC = UIStoryboard.init(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(childVC)
        
    }
    

}
