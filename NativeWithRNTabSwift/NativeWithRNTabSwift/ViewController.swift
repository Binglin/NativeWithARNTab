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
            
            let push = UIButton(type: UIButtonType.custom)
            push.frame = CGRect(x: UIScreen.main.bounds.width/2.0 - 30, y: 100, width: 60, height: 44)
            push.setTitle("push", for: .normal)
            push.setTitleColor(UIColor.black, for: .normal)
            push.addTarget(self, action: #selector(ViewController.push), for: .touchUpInside)
            vc.view.addSubview(push)
            
            vc.tabBarItem = UITabBarItem(title: item, image: nil, selectedImage: nil)
            
            let nav = UINavigationController(rootViewController: vc)
            
            vcs.append(nav)
        }
        
        tab.viewControllers = vcs
        
        self.addChildViewController(tab)
        self.view.addSubview(tab.view)
    }
    
    func push() {
        
        guard let tab = self.childViewControllers.first as? UITabBarController else { return }
        guard let nav = tab.selectedViewController as? UINavigationController else { return }
        let test = UIViewController()
        test.view.backgroundColor = UIColor.white
        test.title = "second page of tab  \(tab.selectedIndex)"
        nav.pushViewController(test, animated: true)
    }
}

