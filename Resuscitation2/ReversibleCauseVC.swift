//
//  ReversibleCauseVC.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 1/13/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit

class ReversibleCauseVC: UIViewController {
    
    @IBOutlet weak var hypoxiaBtn: UIButton!
    @IBOutlet weak var hypovolemiaBtn: UIButton!
    @IBOutlet weak var hypokalemiaBtn: UIButton!
    @IBOutlet weak var acidosisBtn: UIButton!
    @IBOutlet weak var hypothermiaBtn: UIButton!
    @IBOutlet weak var tensionPneuBtn: UIButton!
    @IBOutlet weak var tamponadeBtn: UIButton!
    @IBOutlet weak var toxinBtn: UIButton!
    @IBOutlet weak var pulmEmboBtn: UIButton!
    @IBOutlet weak var myoInfarctBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        greyBtn()
        
    }
    
//    func greyBtn() {
//        hypothermiaBtn.layer.backgroundColor = greyColor
//        hypoxiaBtn.layer.backgroundColor = greyColor
//        hypovolemiaBtn.layer.backgroundColor = greyColor
//        acidosisBtn.layer.backgroundColor = greyColor
//        hypokalemiaBtn.layer.backgroundColor = greyColor
//        tensionPneuBtn.layer.backgroundColor = greyColor
//        tamponadeBtn.layer.backgroundColor = greyColor
//        toxinBtn.layer.backgroundColor = greyColor
//        pulmEmboBtn.layer.backgroundColor = greyColor
//        myoInfarctBtn.layer.backgroundColor = greyColor
//    }
    //
    //    func redBtn() {
    //        hypothermiaBtn.layer.backgroundColor = redColor
    //        hypoxiaBtn.layer.backgroundColor = redColor
    //        hypovolemiaBtn.layer.backgroundColor = redColor
    //        acidosisBtn.layer.backgroundColor = redColor
    //        hypokalemiaBtn.layer.backgroundColor = redColor
    //        tensionPneuBtn.layer.backgroundColor = redColor
    //        tamponadeBtn.layer.backgroundColor = redColor
    //        toxinBtn.layer.backgroundColor = redColor
    //        pulmEmboBtn.layer.backgroundColor = redColor
    //        myoInfarctBtn.layer.backgroundColor = redColor
    //    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func hypoxiaPressed(_ sender: Any) {
        if hypoxiaBtn.layer.backgroundColor == greyColor {
            hypoxiaBtn.layer.backgroundColor = redColor
        } else {
            hypoxiaBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func hypovolemiaPressed(_ sender: Any) {
        if hypovolemiaBtn.layer.backgroundColor == greyColor {
            hypovolemiaBtn.layer.backgroundColor = redColor
        } else {
            hypovolemiaBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func hypokalemiaPressed(_ sender: Any) {
        if hypokalemiaBtn.layer.backgroundColor == greyColor {
            hypokalemiaBtn.layer.backgroundColor = redColor
        } else {
            hypokalemiaBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func acidosisPressed(_ sender: Any) {
        if acidosisBtn.layer.backgroundColor == greyColor {
            acidosisBtn.layer.backgroundColor = redColor
        } else {
            acidosisBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func hypothermiaBtnPressed(_ sender: Any) {
        if hypothermiaBtn.layer.backgroundColor == greyColor {
            hypothermiaBtn.layer.backgroundColor = redColor
        } else {
            hypothermiaBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func toxinPressed(_ sender: Any) {
        if toxinBtn.layer.backgroundColor == greyColor {
            toxinBtn.layer.backgroundColor = redColor
        } else {
            toxinBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func tensionPressed(_ sender: Any) {
        if tensionPneuBtn.layer.backgroundColor == greyColor {
            tensionPneuBtn.layer.backgroundColor = redColor
        } else {
            tensionPneuBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func tamponadePressed(_ sender: Any) {
        if tamponadeBtn.layer.backgroundColor == greyColor {
            tamponadeBtn.layer.backgroundColor = redColor
        } else {
            tamponadeBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func pulmoEmPressed(_ sender: Any) {
        if pulmEmboBtn.layer.backgroundColor == greyColor {
            pulmEmboBtn.layer.backgroundColor = redColor
        } else {
            pulmEmboBtn.layer.backgroundColor = greyColor
        }
    }
    
    @IBAction func miPressed(_ sender: Any) {
        if myoInfarctBtn.layer.backgroundColor == greyColor {
            myoInfarctBtn.layer.backgroundColor = redColor
        } else {
            myoInfarctBtn.layer.backgroundColor = greyColor
        }
    }
}
