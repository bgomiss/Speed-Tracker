//
//  ViewController.swift
//  Speed Tracker
//
//  Created by aycan duskun on 27.02.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var speedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        requestLocationPermission()
        speedLabel = UILabel()
        speedLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(speedLabel)
        NSLayoutConstraint.activate([
            speedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            speedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])    }
    func requestLocationPermission() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let speed = location.speed
            speedLabel.text = String(format: "%.2f km/h", speed * 3.6)
        }
    }
}

