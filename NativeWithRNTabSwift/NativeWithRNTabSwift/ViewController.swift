//
//  ViewController.swift
//  NativeWithRNTabSwift
//
//  Created by ET|冰琳 on 2017/5/17.
//  Copyright © 2017年 IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTab()
    }

    func addTab() {
        
        let tab = UITabBarController()
        tab.tabBar.isTranslucent = false
        
        let titles = ["rn", "native 1", "native 2"]
        
        var vcs: [UIViewController] = []
        
        for item in titles {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.white
            vc.title = item
            
            vc.tabBarItem = UITabBarItem(title: item, image: nil, selectedImage: nil)
            
            let nav = UINavigationController(rootViewController: vc)
            
            vcs.append(nav)
        }
        
        tab.viewControllers = vcs
        
        self.addChildViewController(tab)
        self.view.addSubview(tab.view)
    }
}

