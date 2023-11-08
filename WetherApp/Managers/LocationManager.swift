//
//  LocationManageer.swift
//  WetherApp
//
//  Created by Martin Wainaina on 07/11/2023.
//

import Foundation
import CoreLocation

/***
 This will enable us to manage anything related to location without runnig into errors.
 **/
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
 let manager = CLLocationManager()
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    /// didUpdateLocations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    /// didFailWithError
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("-----> Error: Getting location", error)
        isLoading = false
    }
}
