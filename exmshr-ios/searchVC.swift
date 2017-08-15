//
//  searchVC.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/16.
//  Copyright © 2017 taira120. All rights reserved.
//

import UIKit

class searchVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: self.view.bounds.origin.x,
                           y: self.view.bounds.origin.y,
                           width: self.view.bounds.width,
                           height: self.view.bounds.height)
        let myView = searchView(frame: frame)
        
        setNavBar()
        
        self.view.addSubview(myView)
    }
    
    func setNavBar() {
        self.title = "検索"
        self.navigationItem.hidesBackButton = true
    }
}
