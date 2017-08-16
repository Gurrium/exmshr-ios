//
//  ViewController.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/13.
//  Copyright © 2017 taira120. All rights reserved.
//

import UIKit
import SwiftyJSON

class sharedExamVC: UIViewController, loadDataDelegate {
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var sharedExams: sharedExam?
    var myView = sharedExamView()
    var cells: [sharedExamCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: self.view.bounds.origin.x,
                           y: self.view.bounds.origin.y,
                           width: self.view.bounds.width,
                           height: self.view.bounds.height)
        myView = sharedExamView(frame: frame)
        
        setNavBar()
            
        self.view.addSubview(myView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sharedExams = sharedExam(appDelegate.subject, appDelegate.grade, appDelegate.teacher, appDelegate.kind)
        setDelegate()
    }
    
    func setDelegate() {
        myView.sharedExamCollectionView.dataSource = self
        myView.sharedExamCollectionView.delegate = self
        sharedExams?.delegate = self
    }
    
    func setNavBar() {
        self.title = "過去問一覧"
        let buttonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(self.moveToSearchView))
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    func setCells() {
        cells = []
        // データごとにセルを作ってそれを配列(Cells)に突っ込む関数
        let width = self.view.frame.width / 2 - 1.0
        let height = self.view.frame.height / 3
        for (_, subJson):(String, JSON) in (sharedExams?.data)! {
            cells.append(sharedExamCell(frame: CGRect(x: 0, y: 0, width: width, height: height), data: subJson))
        }
    }
    
    func moveToSearchView() {
        let nextVC = searchVC()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    func didLoadData() {
        setCells()
        myView.sharedExamCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension sharedExamVC: UICollectionViewDataSource {
    // Asks your data source object for the cell that corresponds to the specified item in the collection view.
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.addSubview(cells[indexPath.row])

        return cell
    }
    
    // Asks your data source object for the number of items in the specified section.
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
}

extension sharedExamVC: UICollectionViewDelegateFlowLayout {
    // Asks the delegate for the size of the specified item’s cell.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width / 2 - 1.0
        let height = self.view.frame.height / 3
        return CGSize(width: width, height: height)
    }
    
    // Asks the delegate for the spacing between successive rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    // Asks the delegate for the spacing between successive items in the rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 2.0
    }
    
    // Asks the delegate for the size of the header view in the specified section.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    // Asks the delegate for the size of the footer view in the specified section.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
}
