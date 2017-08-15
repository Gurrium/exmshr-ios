//
//  searchVC.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/16.
//  Copyright © 2017 taira120. All rights reserved.
//

import UIKit
import Eureka

class searchVC: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: self.view.bounds.origin.x,
                           y: self.view.bounds.origin.y,
                           width: self.view.bounds.width,
                           height: self.view.bounds.height)
        let myView = searchView(frame: frame)
        
        setNavBar()
        createForm()
        
        self.view.addSubview(myView)
    }
    
    func setNavBar() {
        self.title = "検索"
        self.navigationItem.hidesBackButton = true
    }
    
    func createForm() {
        form.setValues(["IntRowTag": 8, "TextRowTag": "Hello world!",])
        form +++ Section("Section1")
            <<< PickerInputRow<Int>() {
                $0.title = "学年"
                $0.options = [1, 2, 3, 4, 5]
            }
            <<< PickerInputRow<String>() {
                $0.title = "学年"
                $0.options = ["電気回路", "]
            }
    }
}
