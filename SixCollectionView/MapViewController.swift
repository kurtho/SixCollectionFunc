//
//  ViewController.swift
//  MapTesting
//
//  Created by KurtHo on 2016/8/4.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        CLLocationManager.authorizationStatus()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var hasZoomed = false
    
    func mapView(mapView: MKMapView,
                 didUpdateUserLocation userLocation:
        MKUserLocation) {
        if self.hasZoomed == false {
            self.hasZoomed = true
            
            let region =
                MKCoordinateRegion(center:
                    userLocation.location!.coordinate, span:
                    MKCoordinateSpan(latitudeDelta: 0.005,
                        longitudeDelta: 0.005))
            
            mapView.setRegion(region, animated:
                true)
            
        }
    }
    
    
}

