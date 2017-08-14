//
//  IndexView.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/13.
//  Copyright © 2017 taira120. All rights reserved.
//

import UIKit
import Foundation

class IndexView: UIView {
    /////////

    let hogeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
        label.layer.masksToBounds = true
        label.text = "hoge"
        return label
    }()
    
    /////////
    
    lazy var sharedExamCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 5.0
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.gray
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white

        self.addSubview(sharedExamCollectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
