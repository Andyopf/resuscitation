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
    

//    @IBOutlet weak var checkRhythmLbl: UILabel!
    @IBOutlet weak var CPRTimer: UILabel!
    @IBOutlet weak var twoMinsLbl: UILabel!
    @IBOutlet weak var intervalLbl: UILabel!
    
    @IBOutlet weak var medicationBtn: UIButton!
    
    @IBOutlet weak var cprBtn: UIButton!
    @IBOutlet weak var epinephrineBtn: UIButton!
    @IBOutlet weak var amiodaroneBtn: UIButton!
    @IBOutlet weak var defibrillationBtn: UIButton!
    @IBOutlet weak var reverseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var vfBtn: UIButton!
    @IBOutlet weak var pvtBtn: UIButton!
    @IBOutlet weak var asystoleBtn: UIButton!
    @IBOutlet weak var peaBtn: UIButton!
    
    var CPRTime = 0
    var cprInterval = 20
    var now = NSDate()
    var showDatePattern = DateFormatter()
    var convertedDate: String = ""
    var timer1: Timer!
    var timer2: Timer!
    var timer3: Timer!
    var setCPR = 0
    var countAmio = 0
    
    var backgroundMusicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalCPRTime()
        showDatePattern.dateFormat = "dd-MM-yy;HH:mm:ss"
        convertedDate = showDatePattern.string(from: now as Date)
        playMetronome()
        resetBtn.isHidden = true
        defibrillationBtn.isHidden = true
        cprBtn.isHidden = true
        
    }
    
    // functions
    
    func playMetronome() {
        do {
            let resourcePath1 = Bundle.main.path(forResource: "100bpm", ofType: "mp3")
            //            let resourcePath = NSBundle.mainBundle().pathForResource("100bpm"", ofType: "mp3")!
            let url = NSURL(fileURLWithPath: resourcePath1!)
            try backgroundMusicPlayer = AVAudioPlayer(contentsOf: url as URL)
            
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }

    }
    
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
        if cprInterval > 0 {
            cprInterval -= 1
        } else if cprInterval == 0 {
            
            timer2.invalidate()
            cprInterval = 10
//            rhythmCheck()
            ecgAppear()
            epinephrineBtn.isHidden = true
            defibrillationBtn.isHidden = true
            
        }
        let seconds = cprInterval % 60
        let minutes = cprInterval / 60
        twoMinsLbl.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    func ecgAppear() {
        peaBtn.isHidden = false
        asystoleBtn.isHidden = false
        pvtBtn.isHidden = false
        vfBtn.isHidden = false
    }
    
    func ecgDisappear() {
        peaBtn.isHidden = true
        asystoleBtn.isHidden = true
        pvtBtn.isHidden = true
        vfBtn.isHidden = true
    }
    
//    func rhythmCheck() {
//        checkRhythmLbl.isHidden = false
//        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RhythmVC1.checkEcg), userInfo: nil, repeats: false)
//    }
//    
//    func checkEcg() {
//        checkRhythmLbl.isHidden = true
//    }
    
    func toSummary() {
        self.performSegue(withIdentifier: "ToSummary", sender: nil)
    }
    
    func sequenceDefib() {
        if setCPR == 2 {
            epinephrineBtn.isHidden = false
        } else if setCPR > 2 {
            epinephrineBtn.isHidden = false
            amiodaroneBtn.isHidden = false
        }
    }
    
    func resetDelayed() {
        resetBtn.isHidden = false
    }
    
    //ECG function buttons
    
    @IBAction func VFBtnPressed(_ sender: Any) {
        
        let post = Post(drugPath: "VF", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        ecgDisappear()
        defibrillationBtn.isHidden = false
        cprBtn.isHidden = false
    }
    
    @IBAction func pVTBtnPressed(_ sender: Any) {
        
        let post = Post(drugPath: "pVT", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        ecgDisappear()
        defibrillationBtn.isHidden = false
        cprBtn.isHidden = false
    }
    
    @IBAction func asystoleBtnPressed(_ sender: Any) {
        
        let post = Post(drugPath: "Asystole", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        ecgDisappear()
        epinephrineBtn.isHidden = false
        cprBtn.isHidden = false
    }
    
    @IBAction func PEABtnPressed(_ sender: Any) {
        
        let post = Post(drugPath: "PEA", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        ecgDisappear()
        epinephrineBtn.isHidden = false
        cprBtn.isHidden = false
    }
    
    // CPR buttons
    
    @IBAction func startCPRPressed(_ sender: Any) {
        
        cprCountDown()
        cprBtn.isHidden = true
        setCPR += 1
        if setCPR == 0 {
            let post = Post(drugPath: "Start CPR", timePath: convertedDate)
            DataService.instance.addPosts(post: post)
            setCPR += 1
        } else {
            let post = Post(drugPath: "CPR", timePath: convertedDate)
            DataService.instance.addPosts(post: post)
        }
    }
    
    @IBAction func defibrillationPressed(_ sender: Any) {
        defibrillationBtn.isHidden = true
        let post = Post(drugPath: "defibrillation", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        sequenceDefib()
        
    }
    
    // drugs buttons
    @IBAction func epinepAdministered(_ sender: Any) {
        let post = Post(drugPath: "Epinephrine 1 mg", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        epinephrineBtn.isHidden = true
    }
    
    @IBAction func cordaroneAdministered(_ sender: Any) {
        amiodaroneBtn.isHidden = true
        countAmio += 1
        if countAmio == 1 {
            let post = Post(drugPath: "Amiodarone 300 mg", timePath: convertedDate)
            DataService.instance.addPosts(post: post)
        } else {
            let post = Post(drugPath: "Amiodarone 150 mg", timePath: convertedDate)
            DataService.instance.addPosts(post: post)
        }
    }

    @IBAction func stopCPRPressed(_ sender: Any) {
        toSummary()
        timer1.invalidate()
        timer2.invalidate()
        
        cprBtn.isHidden = true
        defibrillationBtn.isHidden = true
        reverseBtn.isHidden = true
        timer3 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(RhythmVC1.resetDelayed), userInfo: nil, repeats: false)
        
        medicationBtn.isHidden = true
        ecgDisappear()
        twoMinsLbl.isHidden = true
        intervalLbl.isHidden = true
        
        backgroundMusicPlayer.stop()
        
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goReset", sender: nil)
    }
    
    @IBAction func reviewBtnPressed(_ sender: Any) {
        toSummary()
    }


}
