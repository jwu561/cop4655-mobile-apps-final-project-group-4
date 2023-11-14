//
//  ViewController.swift
//  testingMap
//
//  Created by Kevin Infante on 11/10/23.
//

import UIKit
import MapKit

var viewedCities: [City] = []
// .isEmpty is an array property
// .count is an array property
// .first and .last are obvious
//.randomElement() returns random element
//.append()
//.insert("", at: int)
//.removeLast()
//.remove(at: int)
//.contains(element) returns true if array contains said alement

var currentCity: City?
var currentQuestion = 1

class ViewController: UIViewController {
    
    private var lookAroundViewController: MKLookAroundViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lookAroundSegue" {
            if let lookAroundViewController = segue.destination as? MKLookAroundViewController {
                self.lookAroundViewController = lookAroundViewController
            }
        }
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBOutlet weak var lookAround: UIButton!
    

    
    @IBAction func lookAroundTapped(_ sender: Any) {
        if(viewedCities.count == Cities.count){
            print("no more cities on the list. You have reached the end of the quiz.")
            return
        }
        print("viewed cities: ", viewedCities.count)
        fetchLookAroundScene(with: CLLocationCoordinate2D(latitude: currentCity!.latitude, longitude: currentCity!.longitude))
        performSegue(withIdentifier: "lookAroundSegue", sender: nil)
    }
    

    @IBAction func optionBtnTapped(_ sender: UIButton){
        if(viewedCities.count == Cities.count){
            print("no more cities on the list. You have reached the end.")
            return
        }
        //note, the force unwrap with ! may be risky
        //should only be used if it is certain that the object is not nil
        print(sender.titleLabel!.text!)
        //I need to slice the string and remove the first 3 letters
        // getting a substring in Swift is stupid
        let text = sender.titleLabel!.text!
        let startIndex = text.index(text.startIndex, offsetBy: 3)
        let countryName = String(text[startIndex...])
        print(countryName)
        
        

        if (currentCity!.country == countryName){
            print("correct!")
            
            //increment the question number, change the label
            currentQuestion = currentQuestion + 1
            print(currentQuestion)
            questionLabel.text = "\(currentQuestion). What country is this?"

            //get a new random city
            currentCity = Cities.randomElement()
            
            //if it's not in the "viewedCities" list, then add it
            if(!viewedCities.contains(currentCity!)){
                viewedCities.append(currentCity!)
            }
            //else, do while loop until current City is not in viewedCities, or until viewedCities contains all cities.
            else{
                while(viewedCities.contains(currentCity!) && viewedCities.count != Cities.count){
                    currentCity = Cities.randomElement()
                }
                if(viewedCities.count == Cities.count){
                    print("No more cities on the list!")
                }
                else{
                    viewedCities.append(currentCity!)
                }
            }
        } else {
            print("wrong.")
        }
        
    }
    
    // Function to fetch LookAround scene
    func fetchLookAroundScene(with coordinate: CLLocationCoordinate2D) {
        let lookAroundSceneRequest = MKLookAroundSceneRequest(coordinate: coordinate)
        
        Task {
            do {
                // Issue request
                guard let lookAroundScene = try await lookAroundSceneRequest.scene else {
                    print("LookAround data is not available for the location.")
                    return
                }
                
                // Assign the scene to the LookAroundViewController
                lookAroundViewController?.scene = lookAroundScene
                
                // Perform the segue
                //performSegue(withIdentifier: "lookAroundSegue", sender: nil)
            } catch {
                print("Error fetching LookAround scene: \(error)")
            }
        }
    }
    override func viewDidLoad() {
        //print(miami.name, miami.country, miami.latitude, miami.longitude)
        currentCity = Cities.randomElement()
        viewedCities.append(currentCity!)
        super.viewDidLoad()
    }
}


// // previously this was right below func lookAroundTapped
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        let locationCoordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
//
//        let lookAroundSceneRequest = MKLookAroundSceneRequest(coordinate: locationCoordinate)
//
//        print(lookAroundSceneRequest)
//        Task {
//            //create lookaround scene request
//            do{
//                // Issue request
//                guard let lookAroundScene = try await lookAroundSceneRequest.scene else { print("returned");return }
//                //if get scene request succeeds, just assign the scene to our lookaround view controller
//                //if we get nil for the scene, it means lookaround data is not available for the location
//
//                print(lookAroundScene)
//                //the above statement is currently printed by the program, which suggests that nil was not returned.
//                lookAroundViewController?.scene = lookAroundScene
//
//            } catch {
//                print("caught")
//            }
//        }
//    }





//    @IBOutlet weak var preview: UIView!
//    //consider making the above a private var instead
//    //there should be a mapview here, but I think it connects to another screen
//    private var lookAroundViewController: MKLookAroundViewController?
//
//    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
//        // grab lookaround viewcontroller instance
//        if segue.identifier == "presentLookAround" {
//            if let lookAroundViewController = segue.destination as? MKLookAroundViewController {
//                self.lookAroundViewController = lookAroundViewController
//            }
//        }
//    }
//
//    @IBAction func landmark(_ sender: UISegmentedControl){
//        //cleanUpPreview()
//        let request = MKLocalSearch.Request()
//
//        if sender.selectedSegmentIndex == 0 {
//            request.naturalLanguageQuery = "Ferry Building"
//        }
//        //more else ifs
//
//        let search = MKLocalSearch(request: request)
//        search.start {response, error in
//            guard let response = response else {return}
//            if let item = response.mapItems.first {
//                //if the request succeeds, we will get a map item which will be used in the following animation and lookaround scene retrieval
//                UIView.animate(withDuration: 6){
//                    //camera animation
//                    let camera = MKMapCamera(lookingAt: item, forViewSize: self.mapView.frame.size, allowPitch: true)
//                    //"pitch view to landmarks and a top-down view to other places
//                    self.mapView.camera = camera
//                } completion: { _ in
//                    //prepare lookAround preview
//                    //"once the camera animation is completed, we will show its lookaround preview
//                    self.configureLookAroundScene(item)
//                    //is this a function i have to define?
//                }
//            }
//        }
//    }
//
//    func configureLookAroundScene(_ item: MKMapItem){
//        guard let lookAroundViewController = self.lookAroundViewController else { return }
//        //determine if the lookaround data is available for this map item
//        let lookAroundRequest = MKLookAroundSceneRequest(mapItem: item)
//        Task {
//            //create lookaround scene request
//            do{
//                // Issue request
//                guard let lookAroundScene = try await lookAroundRequest.scene else { return }
//                //if get scene request succeeds, just assign the scene to our lookaround view controller
//                //if we get nil for the scene, it means lookaround data is not available for the location
//                lookAroundViewController.scene = lookAroundScene
//
//                //show lookaround preview
//                self.preview.isHidden = false
//            } catch {
//
//            }
//        }
//    }












//check for data availability
//pass the data on to either a lookaround view controller or a lookaround snapshotter
//conditionally show lookaround ui

//first step is to check for data availability


//class lookAroundSceneRequest {
//    //you can initialize a new instance with either a coordinate, or a map item (MKMapItem)
//    init(coodinate:CLLocationCoordinate2D)
//    //next, you want to retrieve its scene property. This is an optional async property. If data is available, you will get back a scene instance. If data is not available, you will get a nil instead.
//}
//class MKLookAroundScene {
//    //opaque class with no properties, it acts as a token that ensures the availability of lookaround imagery for a requested location
//}
