//
//  searchVC.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/16.
//  Copyright © 2017 taira120. All rights reserved.
//

import UIKit
import Eureka
import SwiftyJSON

class searchVC: FormViewController, loadDataDelegate {
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let searchQueries = searchQuery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: self.view.bounds.origin.x,
                           y: self.view.bounds.origin.y,
                           width: self.view.bounds.width,
                           height: self.view.bounds.height)
        let myView = searchView(frame: frame)
        
        searchQueries.delegate = self
        setNavBar()
        
        self.view.addSubview(myView)
    }
    
    func setNavBar() {
        self.title = "検索"
//        self.navigationItem.hidesBackButton = true
    }
    
    func didLoadData() {
        createForm()
    }
    
    func createForm() {        
        form +++ Section()
            <<< PickerInputRow<String>("subject") {
                $0.title = "教科"
                $0.options = searchQueries.subjects
                $0.baseCell.tintColor = .black
            }
            <<< PickerInputRow<Int>("grade") {
                $0.title = "学年"
                $0.options = [1, 2, 3, 4, 5]
            }
            <<< PickerInputRow<String>("teacher") {
                $0.title = "先生"
                $0.options = searchQueries.teachers
            }
            <<< PickerInputRow<String>("kind") {
                $0.title = "テストの種類"
                $0.options = searchQueries.kinds
            }
            <<< TextRow("hoge") { row in
                row.title = "テストの種類"
                row.placeholder = "hoge"
            }
            <<< ButtonRow() {
                $0.title = "検索"
            }.onCellSelection { cell, row in
                self.setQuery()
                self.navigationController?.popViewController(animated: false)
            }
        
//        setQuery()
    }
    
    func setQuery() {
        appDelegate.subject = (form.rowBy(tag: "subject")?.value)!
        appDelegate.grade = (form.rowBy(tag: "grade")?.value)!
        appDelegate.teacher = (form.rowBy(tag: "teacher")?.value)!
        appDelegate.kind = (form.rowBy(tag: "kind")?.value)!
    }
}
