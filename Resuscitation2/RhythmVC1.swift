//
//  RhythmVC1.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 2/8/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit
import AVFoundation

class RhythmVC1: UIViewController {

    @IBOutlet weak var CPRTimer: UILabel!
    @IBOutlet weak var cprBtn: UIButton!
    @IBOutlet weak var startCPRLbl: UILabel!
    
    var CPRTime = 12345
    var cprInterval = 120
    var now = NSDate()
    var showDatePattern = DateFormatter()
    var convertedDate: String = ""
    var timer1: Timer!
    var timer2: Timer!
    
    var medtronome: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalCPRTime()
        showDatePattern.dateFormat = "dd-MM-yy;HH:mm:ss"
        convertedDate = showDatePattern.string(from: now as Date)
        
        do {
            let resourcePath1 = Bundle.main.path(forResource: "100bpm", ofType: "mp3")
            //            let resourcePath = NSBundle.mainBundle().pathForResource("100bpm"", ofType: "mp3")!
            let url = NSURL(fileURLWithPath: resourcePath1!)
            try medtronome = AVAudioPlayer(contentsOf: url as URL)
            
            medtronome.prepareToPlay()
            medtronome.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    // functions
    
    func totalCPRTime() {
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RhythmVC1.cumulativeCPR), userInfo: nil, repeats: true)
    }
    
    func cumulativeCPR() {
        CPRTime += 1
        let seconds = CPRTime % 60
        let minutes = CPRTime / 60
        let hours = CPRTime / 3600
        CPRTimer.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func cprCountDown() {
        
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RhythmVC1.CPRIntervalTime), userInfo: nil, repeats: true)
        
    }
    
    func CPRIntervalTime() {
        cprInterval -= 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rhythmToVF" {
            let destination1_1VC : VFpVT = segue.destination as! VFpVT
            let destination1_2VC : VFpVT = segue.destination as! VFpVT
            destination1_1VC.CPRTime = CPRTime
            destination1_2VC.CPRInterval = cprInterval
        } else if segue.identifier == "rhythmToAsyst" {
            let destination2_1VC : AsystolePEAVC = segue.destination as! AsystolePEAVC
            let destination2_2VC : AsystolePEAVC = segue.destination as! AsystolePEAVC
            destination2_1VC.CPRTime = CPRTime
            destination2_2VC.CPRInterval = cprInterval
        }
    }
    
    func rhythmToVf() {
        self.performSegue(withIdentifier: "rhythmToVF", sender: nil)
    }
    
    func rhythmToAsyst() {
        self.performSegue(withIdentifier: "rhythmToAsyst", sender: nil)
    }
    
    //ECG function buttons
    
    @IBAction func VFBtnPressed(_ sender: Any) {
        rhythmToVf()
        let post = Post(drugPath: "VF", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func pVTBtnPressed(_ sender: Any) {
        rhythmToVf()
        let post = Post(drugPath: "pVT", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func asystoleBtnPressed(_ sender: Any) {
        rhythmToAsyst()
        let post = Post(drugPath: "Asystole", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func PEABtnPressed(_ sender: Any) {
        rhythmToAsyst()
        let post = Post(drugPath: "PEA", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func startCPRPressed(_ sender: Any) {
        let post = Post(drugPath: "Start CPR", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        cprCountDown()
        cprBtn.isHidden = true
        startCPRLbl.isHidden = true

    }


}
