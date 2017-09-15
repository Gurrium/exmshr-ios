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
        searchQueries.delegate = self
        setNavBar()
    }
    
    func setNavBar() {
        self.title = "検索設定"
//        self.navigationItem.hidesBackButton = true
    }
    
    func didLoadData() {
        createForm()
    }
    
    func createForm() {        
        form +++ Section()
            <<< PushRow<String>("subject") {
                $0.title = "教科"
                $0.selectorTitle = "Pick a number"
                $0.options = searchQueries.subjects
            }
            <<< PushRow<Int>("grade") {
                $0.title = "学年"
                $0.options = [1, 2, 3, 4, 5]
            }
            <<< PushRow<String>("teacher") {
                $0.title = "先生"
                $0.options = searchQueries.teachers
            }
            <<< PushRow<String>("kind") {
                $0.title = "テストの種類"
                $0.options = searchQueries.kinds
            }

            +++ Section()
            <<< ButtonRow() {
                $0.title = "検索"
            }.onCellSelection{_, _ in
                self.setQuery()
                self.navigationController?.popViewController(animated: true)
            }
    }
    
    func setQuery() {
        let subjectRow: PushRow? = form.rowBy(tag: "subject")
        let gradeRow: TextRow? = form.rowBy(tag: "grade")
        let teacherRow: TextRow? = form.rowBy(tag: "teacher")
        let kindRow: TextRow? = form.rowBy(tag: "kind")
        print(subjectRow?.value)
        appDelegate.subject = subjectRow?.value
        appDelegate.subject = gradeRow?.value
        appDelegate.subject = teacherRow?.value
        appDelegate.subject = kindRow?.value
    }
}
