//
//  SummaryView.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 1/13/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit

class SummaryView: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalTImeCPRLbl: UILabel!
        
        
    var CPRTime = 1234
    var countdownTime = 4321
    var eventOfTime = "event"
    var timeflow = "TIMELINE"
    var timer1: Timer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.delegate = self
        tableView.dataSource = self
//        DataService.instance.loadPosts()
        timeFormat()
            
            //        NotificationCenter.default.addObserver(self, selector: Selector(("onPostsLoaded:")), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
            //        NotificationCenter.default.addObserver(self, selector: Selector("onPostsLoaded:"), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
            
            
    }
    
    func timeFormat() {
        CPRTime += 1
        let seconds = CPRTime % 60
        let minutes = CPRTime / 60
        let hours = CPRTime / 3600
        totalTImeCPRLbl.text = String(format: "%02d:%02d:%02d",hours, minutes, seconds)
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post: post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post: post)
            return cell
        }
            
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(){
        tableView.reloadData()
    }
        
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
            return true
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            DataService.instance.loadedPosts.remove(at: indexPath.row) // cannot what?
            //            self.onPostsLoaded()
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
        
    func deleteArray() {
        DataService.instance.loadedPosts.removeAll()
        tableView.reloadData()
    }
        
    @IBAction func back(_ sender: Any) {
            dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        deleteArray()
        CPRTime = 0
    }
        
}
