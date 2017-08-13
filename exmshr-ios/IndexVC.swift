//
//  ViewController.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/13.
//  Copyright © 2017 taira120. All rights reserved.
//

import UIKit

class IndexVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: self.view.bounds.origin.x,
                                   y: self.view.bounds.origin.y,
                                   width: self.view.bounds.width,
                                   height: self.view.bounds.height)
        let view = IndexView(frame: frame)
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

