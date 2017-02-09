//
//  Post.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 1/13/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit

class Post: NSObject, NSCoding {
    
    fileprivate var _drugPath: String!
    fileprivate var _timePath: String!
    
    var drugPath: String {
        return _drugPath
    }
    
    var timePath: String {
        return _timePath
    }
    
    
    
    init(drugPath: String, timePath: String) {
        self._drugPath = drugPath
        self._timePath = timePath
    }
    
    override init() {
        
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._drugPath = aDecoder.decodeObject(forKey: "drugPath") as! String
        self._timePath = aDecoder.decodeObject(forKey: "timePath") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._drugPath, forKey: "drugPath")
        aCoder.encode(self._timePath, forKey: "timePath")
    }
    
}
