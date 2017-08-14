//
//  ViewController.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/13.
//  Copyright © 2017 taira120. All rights reserved.
//

import UIKit

class IndexVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: self.view.bounds.origin.x,
                                   y: self.view.bounds.origin.y,
                                   width: self.view.bounds.width,
                                   height: self.view.bounds.height)
        let view = IndexView(frame: frame)
        
        view.sharedExamCollectionView.dataSource = self
        view.sharedExamCollectionView.delegate = self
        
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ----- start for protocol UICollectionViewDataSource -----
    
    // Asks your data source object for the cell that corresponds to the specified item in the collection view.
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        
        return cell
    }
    
    // Asks your data source object for the number of items in the specified section.
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // ----- end for protocol UICollectionViewDataSource -----
    
    // ----- start for protocol UICollectionViewDelegateFlowLayout -----
    
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
        return CGSize(width: 50, height: 10)
    }
    
    // Asks the delegate for the size of the footer view in the specified section.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 50, height: 10)
    }
    
    // ----- end for protocol UICollectionViewDelegateFlowLayout -----
}
