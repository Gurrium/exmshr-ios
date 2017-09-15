//
//  Index.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/15.
//  Copyright © 2017 taira120. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class sharedExam {
    weak var delegate: loadDataDelegate?
    
    var data: JSON = JSON({})
    
    init (_ subject: String?, _ grade: String?, _ teacher: String?, _ kind: String?) {
        setData(subject, grade, teacher, kind)
    }
    
    private func setData(_ subject: String?, _ grade: String?, _ teacher: String?, _ kind: String?) {
        let params: Parameters = ["subject": subject ?? "", "grade": grade ?? "", "teacher": teacher ?? "", "kind": kind ?? ""]
        let url = "http://192.168.100.6:3000/shared_exams.json"
        
        Alamofire.request(url, parameters:params).responseJSON { response in
            print(String(describing: response.request))  // original URL request
            print(String(describing: response.response)) // HTTP URL response
            print(String(describing: response.data) )    // server data
            print(response.result)   // result of response serialization
            
            if let json = response.result.value {
                print("SwiftyJSON: \(JSON(json))")
                self.data = JSON(json)
                self.delegate?.didLoadData()
            }
        }
    }
}

protocol loadDataDelegate: class {
    func didLoadData()
}
