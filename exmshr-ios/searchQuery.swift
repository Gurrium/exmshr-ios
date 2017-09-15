//
//  searchQuery.swift
//  exmshr-ios
//
//  Created by 金子平 on 2017/08/16.
//  Copyright © 2017 taira120. All rights reserved.
//

import Alamofire
import SwiftyJSON

class searchQuery {
    var data: JSON = JSON({})
    var subjects: [String] = []
    var teachers: [String] = []
    var kinds: [String] = []
    weak var delegate: loadDataDelegate?

    init() {
        getData()
    }
    
    func getData() {
        let url = "http://192.168.100.6:3000/shared_exams/json_list.json"
        Alamofire.request(url).responseJSON { response in
            print(String(describing: response.request))  // original URL request
            print(String(describing: response.response)) // HTTP URL response
            print(String(describing: response.data) )    // server data
            print(response.result)   // result of response serialization
            
            if let json = response.result.value {
                print("SwiftyJSON: \(JSON(json))")
                self.data = JSON(json)
                self.setData()
                self.delegate?.didLoadData()
            }
        }
    }
    
    func setData() {
        let jsonDic = data.dictionary
        
        if let _ = jsonDic {
            for (key, _) in (jsonDic?["subjects"]?.dictionary)! {
                subjects.append(key)
            }
            for (key, _) in (jsonDic?["teachers"]?.dictionary)! {
                teachers.append(key)
            }
            for (key, _) in (jsonDic?["kinds"]?.dictionary)! {
                kinds.append(key)
            }
        }
    }
}
