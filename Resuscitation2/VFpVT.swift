//
//  VFpVT.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 2/7/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit
import AVFoundation

class VFpVT: UIViewController {
    
    @IBOutlet weak var CPRBtn: UIButton!
    @IBOutlet weak var totalCPRTimeLbl: UILabel!
    @IBOutlet weak var cprIntervalLbl: UILabel!
    @IBOutlet weak var checkRhythmLbl: UILabel!
    @IBOutlet weak var twoMinsLbl: UILabel!
    
    // Buttons
    
    @IBOutlet weak var vfBtn: UIButton!
    @IBOutlet weak var pvtBtn: UIButton!
    @IBOutlet weak var asystoleBtn: UIButton!
    @IBOutlet weak var peaBtn: UIButton!
    
    @IBOutlet weak var defibrillationBtn: UIButton!
    @IBOutlet weak var reverseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var epinephrineBtn: UIButton!
    @IBOutlet weak var amiodaroneBtn: UIButton!
    
    var CPRTime = 12345
    var CPRInterval = 120
    var timeOfVT = 0
    var countAmio = 0
    var myTimer1: Timer!
    var myTimer2: Timer!
    var myTimer3: Timer!
    var now = NSDate()
    var showDatePattern = DateFormatter()
    var convertedDate: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cumulativeCPR()
        countDownCPR()
        showDatePattern.dateFormat = "dd-MM-yy;HH:mm:ss"
        convertedDate = showDatePattern.string(from: now as Date)
        resetBtn.isHidden = true
        epinephrineBtn.isHidden = true
        amiodaroneBtn.isHidden = true
        ecgDisappear()
        checkRhythmLbl.isHidden = true
        CPRBtn.isHidden = true
        
        
    }
    
    // Functions
    
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
    
    func cumulativeCPR() {
        myTimer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(VFpVT.totalime), userInfo: nil, repeats: true)
    }
    
    func totalime() {
        CPRTime += 1
        let seconds = CPRTime % 60
        let minutes = CPRTime / 60
        let hours = CPRTime / 3600
        totalCPRTimeLbl.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func countDownCPR() {
        myTimer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(VFpVT.cpr2Min), userInfo: nil, repeats: true)
    }
    
    func cpr2Min(){
        
        if CPRInterval > 0 {
           CPRInterval -= 1
        } else if CPRInterval == 0 {
            checkRhythmLbl.isHidden = false
            _ = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(VFpVT.checkEcg), userInfo: nil, repeats: false)
            CPRInterval = 10
            ecgAppear()
            epinephrineBtn.isHidden = true
            defibrillationBtn.isHidden = true
            
        }
        let seconds = CPRInterval % 60
        let minutes = CPRInterval / 60
        twoMinsLbl.text = String(format: "%02d:%02d", minutes, seconds)
        
    }
    
    func checkEcg() {
        checkRhythmLbl.isHidden = true
    }
    
    func toSummary() {
        self.performSegue(withIdentifier: "VFpVT1ToSummary", sender: nil)
    }
    
    func resetDelayed() {
        resetBtn.isHidden = false
    }
    
    func sequenceDefib() {
        if timeOfVT == 1 {
            // cpr only
        } else if timeOfVT == 2 {
            epinephrineBtn.isHidden = false
        } else if timeOfVT > 2 {
            epinephrineBtn.isHidden = false
            amiodaroneBtn.isHidden = false
            // give amiodarone and epinephrine
        }
    }
    
    func vtToAyst() {
        self.performSegue(withIdentifier: "vtToAsyst", sender: nil)
    }
    
    // Buttons pressed

    @IBAction func CPRPressed(_ sender: Any) {
        CPRBtn.isHidden = true
        let post = Post(drugPath: "CPR", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func defibrillationPressed(_ sender: Any) {
        defibrillationBtn.isHidden = true
        let post = Post(drugPath: "defibrillation", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        timeOfVT += 1
        sequenceDefib()
        
    }
    
    // ECG buttons
    
    @IBAction func vfBtnPressed(_ sender: Any) {
        CPRBtn.isHidden = false
        let post = Post(drugPath: "VF", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        ecgDisappear()
        defibrillationBtn.isHidden = false
    }
    
    @IBAction func pvtBtnPressed(_ sender: Any) {
        CPRBtn.isHidden = false
        let post = Post(drugPath: "pVT", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
        ecgDisappear()
        defibrillationBtn.isHidden = false
    }
    
    @IBAction func peaBtnPressed(_ sender: Any) {
        vtToAyst()
    }
    @IBAction func aystoleBtnPressed(_ sender:Any) {
        vtToAyst()
    }
    // CPR drugs buttons
    
    @IBAction func epinepAdministered(_ sender: Any) {
        let post = Post(drugPath: "Epinephrine 1 mg", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    @IBAction func cordaroneAdministered(_ sender: Any) {
        countAmio += 1
        if countAmio == 1 {
            let post = Post(drugPath: "Amiodarone 300 mg", timePath: convertedDate)
            DataService.instance.addPosts(post: post)
        } else {
            let post = Post(drugPath: "Amiodarone 150 mg", timePath: convertedDate)
            DataService.instance.addPosts(post: post)
        }
    }
    
    
    @IBAction func reviewPressed(_ sender: Any) {
        toSummary()
    }
    
    @IBAction func stopCPRPressed(_ sender: Any) {
        toSummary()
        myTimer1.invalidate()
        myTimer2.invalidate()
        
        CPRBtn.isHidden = true
        defibrillationBtn.isHidden = true
        reverseBtn.isHidden = true
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(VFpVT.resetDelayed), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goReset", sender: nil)
    }

}
