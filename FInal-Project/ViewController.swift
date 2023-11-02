//
//  ViewController.swift
//  FInal-Project
//
//  Created by Kevin Infante on 10/5/23.
//

import UIKit
import MapKit
import CoreLocation  // Import CoreLocation to access the CLLocationManagerDelegate protocol



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var lookAround: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        // the code below fetches info from an API
        // Create a search URL for fetching cities
        let url = URL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/cities/123214?rapidapi-key="+api_key)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                print(jsonDictionary)
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        // Initiate the network request
        task.resume()
        
        
        
        
        
        
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let coordinate = location.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }

    func enableLookAround() {
        let camera = MKMapCamera()
        camera.centerCoordinate = mapView.region.center
        camera.heading = 0  // Adjust this value as needed to control the initial orientation
        camera.pitch = 80   // Adjust this value as needed to control the initial pitch

        mapView.camera = camera
    }

    @IBAction func startLookAround(_ sender: UIButton) {
        enableLookAround()
    }


}

