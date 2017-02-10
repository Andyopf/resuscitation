//
//  ViewController.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 1/13/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var resetBtn: BigButton!
    @IBOutlet weak var historyBtn: BigButton!
    
    var countertime = 0
//    var now = NSDate()
//    var showDatePattern = DateFormatter()
    var convertedDate: String = ""
    
    let locationManager = CLLocationManager()
    var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countertime = 0
        
        locationAuthStatus()
        
        
    }
    
    func dateEvent() {
        var now = NSDate()
        var showDatePattern = DateFormatter()
        showDatePattern.dateFormat = "dd-MM-yy;HH:mm:ss"
        convertedDate = showDatePattern.string(from: now as Date)
    }
    
    func startCPR() {
        countCPRTime()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        placeLbl.text = "Location:\(locValue.latitude) \(locValue.longitude)"
    }
    
    func countCPRTime() {
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.cumulativeCPR), userInfo: nil, repeats: true)
    }
    
    func cumulativeCPR() {
        countertime += 1
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "cardiacArrest" {
            let destination1_1VC : RhythmVC1 = segue.destination as! RhythmVC1
            destination1_1VC.CPRTime = countertime
        }
        
    }
    
    @IBAction func cardiacArrestPressed(_ sender: Any) {
        
        startCPR()
        dateEvent()
        self.performSegue(withIdentifier: "cardiacArrest", sender: nil)
        let post1 = Post(drugPath: "Cardiac arrest", timePath: convertedDate)
        DataService.instance.addPosts(post: post1)
        
    }
    
    @IBAction func resetAll(_ sender: Any) {
        DataService.instance.loadedPosts.removeAll()
    }
    
}
