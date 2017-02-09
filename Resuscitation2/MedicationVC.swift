//
//  MedicationVC.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 2/8/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit

class MedicationVC: UIViewController {
    
    var now = NSDate()
    var showDatePattern = DateFormatter()
    var convertedDate: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        showDatePattern.dateFormat = "dd-MM-yy;HH:mm:ss"
        convertedDate = showDatePattern.string(from: now as Date)
        
    }
    
    @IBAction func calciumGluconateAdministered(_ sender: Any) {
        let post = Post(drugPath: "10% CaGluconate 10 ml", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func sodiumBicarbAdministered(_ sender: Any) {
        let post = Post(drugPath: "7.5% NaHCO3 50 ml", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func insulinAdministered(_ sender: Any) {
        let post = Post(drugPath: "RI 10 units", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func glucoseAdministered(_ sender: Any) {
        let post = Post(drugPath: "50% glucose 50 ml", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }
    
    @IBAction func adrenalineInjPressed(_ sender: Any) {
        let post = Post(drugPath: "Epinephrine 1 mg", timePath: convertedDate)
        DataService.instance.addPosts(post: post)
    }

    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
