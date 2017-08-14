//
//  ViewController.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/13.
//  Copyright © 2017 taira120. All rights reserved.
//

import UIKit

class IndexVC: UIViewController, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: self.view.bounds.origin.x,
                                   y: self.view.bounds.origin.y,
                                   width: self.view.bounds.width,
                                   height: self.view.bounds.height)
        let view = IndexView(frame: frame)
        view.sharedExamCollectionView.dataSource = self
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hogeLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
            label.backgroundColor = .white
            label.text = "hoge"
            return label
        }()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.addSubview(hogeLabel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

