//
//  sharedExamCollectionViewCell.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/16.
//  Copyright © 2017 taira120. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class sharedExamCell: UIView {
    let data: JSON
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(x: 5, y: 5, width: self.bounds.width - 10, height: self.bounds.width - 10))
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
//        stackView.spacing = 3
        return stackView
    }()
    
    lazy var subjectLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 50))
        label.text = "\(self.data["subject"])"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    lazy var gradeAndKindLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 50))
        label.text = "\(self.data["grade"])年\(self.data["kind"])"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    init(frame: CGRect, data: JSON) {
        self.data = data
        super.init(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        self.backgroundColor = .white
        //        self.clipsToBounds = true
        
        containerStackView.addArrangedSubview(subjectLabel)
        containerStackView.addArrangedSubview(gradeAndKindLabel)
        self.addSubview(containerStackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
