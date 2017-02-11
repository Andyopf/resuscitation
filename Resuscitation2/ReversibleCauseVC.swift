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
        number1()
        number2()
        number3()
        number4()
        number5()
        number6()
        number7()
        number8()
        number9()
        number10()
        
    }
    
    func number1() {
        if hypoxiaBtn.layer.backgroundColor == greyColor {
            hypoxiaBtn.layer.backgroundColor = redColor
        } else {
            hypoxiaBtn.layer.backgroundColor = greyColor
        }
    }
    func number2() {
        if hypovolemiaBtn.layer.backgroundColor == greyColor {
            hypovolemiaBtn.layer.backgroundColor = redColor
        } else {
            hypovolemiaBtn.layer.backgroundColor = greyColor
        }
    }
    func number3() {
        if hypokalemiaBtn.layer.backgroundColor == greyColor {
            hypokalemiaBtn.layer.backgroundColor = redColor
        } else {
            hypokalemiaBtn.layer.backgroundColor = greyColor
        }

    }
    func number4() {
        if acidosisBtn.layer.backgroundColor == greyColor {
            acidosisBtn.layer.backgroundColor = redColor
        } else {
            acidosisBtn.layer.backgroundColor = greyColor
        }
    }
    func number5() {
        if hypothermiaBtn.layer.backgroundColor == greyColor {
            hypothermiaBtn.layer.backgroundColor = redColor
        } else {
            hypothermiaBtn.layer.backgroundColor = greyColor
        }
    }
    func number6() {
        if tensionPneuBtn.layer.backgroundColor == greyColor {
            tensionPneuBtn.layer.backgroundColor = redColor
        } else {
            tensionPneuBtn.layer.backgroundColor = greyColor
        }

    }
    func number7() {
        if toxinBtn.layer.backgroundColor == greyColor {
            toxinBtn.layer.backgroundColor = redColor
        } else {
            toxinBtn.layer.backgroundColor = greyColor
        }
    }
    func number8() {
        if tamponadeBtn.layer.backgroundColor == greyColor {
            tamponadeBtn.layer.backgroundColor = redColor
        } else {
            tamponadeBtn.layer.backgroundColor = greyColor
        }
    }
    func number9() {
        if pulmEmboBtn.layer.backgroundColor == greyColor {
            pulmEmboBtn.layer.backgroundColor = redColor
        } else {
            pulmEmboBtn.layer.backgroundColor = greyColor
        }
    }
    func number10() {
        if myoInfarctBtn.layer.backgroundColor == greyColor {
            myoInfarctBtn.layer.backgroundColor = redColor
        } else {
            myoInfarctBtn.layer.backgroundColor = greyColor
        }
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func hypoxiaPressed(_ sender: Any) {
        number1()
    }
    
    @IBAction func hypovolemiaPressed(_ sender: Any) {
        number2()
    }
    
    @IBAction func hypokalemiaPressed(_ sender: Any) {
        number3()
    }
    
    @IBAction func acidosisPressed(_ sender: Any) {
        number4()
    }
    
    @IBAction func hypothermiaBtnPressed(_ sender: Any) {
        number5()
    }
    
    @IBAction func toxinPressed(_ sender: Any) {
        number6()
    }
    
    @IBAction func tensionPressed(_ sender: Any) {
        number7()
    }
    
    @IBAction func tamponadePressed(_ sender: Any) {
        number8()
    }
    
    @IBAction func pulmoEmPressed(_ sender: Any) {
        number9()
    }
    
    @IBAction func miPressed(_ sender: Any) {
        number10()
    }
}
