//
//  DataService.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 1/13/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static var instance = DataService()
    
    let KEY_POSTS = "posts"
    
    private var _loadedPosts = [Post]()
    var loadedPosts: [Post] {
        get{
            return _loadedPosts
        } set{
            _loadedPosts = newValue
        }
    }
    
    //    var loadedPosts: [Post] {
    //        return _loadedPosts
    //    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(postsData, forKey: KEY_POSTS)
    }
    
    func loadPosts() {
        if let postsData = UserDefaults.standard.object(forKey: KEY_POSTS) as? Data {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
        
    }
    
    func addPosts(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
}
