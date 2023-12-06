//
//  ViewController.swift
//  testingMap
//
//  Created by Kevin Infante on 11/10/23.
//

import UIKit
import MapKit
import Swift
import WebKit

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

var correctAnswers = 0
var wrongAnswers = 0

class ViewController: UIViewController, WKNavigationDelegate {
    
    var hardMode: Bool?
    
    private var lookAroundViewController: MKLookAroundViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lookAroundSegue" {
            if let lookAroundViewController = segue.destination as? MKLookAroundViewController {
                self.lookAroundViewController = lookAroundViewController
                lookAroundViewController.view.isUserInteractionEnabled = true //I don't think this does anything
            }
        }
        if segue.identifier == "quizToScores" {
            if let scoresVC = segue.destination as? ScoresViewController {
                scoresVC.correctAnswers = correctAnswers
                scoresVC.wrongAnswers = wrongAnswers
                if hardMode == true {
                    scoresVC.questions = Cities.count
                }
                else {
                    scoresVC.questions = 10
                }
            }
        }
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    //@IBOutlet weak var cityImageView: UIImageView!
    
    @IBOutlet weak var lookaroundContainerView: UIView!
    
    @IBOutlet weak var feedbackLabel: UILabel!
    
    
    @IBOutlet weak var NomorecityLabel: UITextView!
    
    @IBOutlet weak var hintBtn: UIButton!
    @IBOutlet weak var scoreScreenBtn: UIButton!
    
    @IBOutlet weak var flagWebView: WKWebView!
    
    
    
    
    @IBAction func optionBtnTapped(_ sender: UIButton){
        if(viewedCities.count == Cities.count ||
           (hardMode == false && correctAnswers > 9)) {
            print("You have reached the end.")
            NomorecityLabel.text = "You have reached the end."
            feedbackLabel.text = ""
            performSegue(withIdentifier: "quizToScores", sender: nil)
            return
        }
        
        let text = sender.titleLabel!.text!
        let startIndex = text.index(text.startIndex, offsetBy: 3)
        let countryName = String(text[startIndex...])
        
        if (currentCity!.country == countryName) {
            correctAnswers += 1
            feedbackLabel.text = "Correct!"
            flagWebView.isHidden = true
            if (hardMode == false && correctAnswers > 9){
                performSegue(withIdentifier: "quizToScores", sender: nil)
                return
            }
            
            currentQuestion += 1
            questionLabel.text = "\(currentQuestion). What country is this?"

            // Call initializeCurrentCity() to fetch a new city and its LookAround scene
            initializeCurrentCity()

            // Call randomizedChoices() to update the choices on the UI
            randomizedChoices()
        } else {
            wrongAnswers += 1
            feedbackLabel.text = "Wrong."
        }
    }
    
    func fetchLookAroundScene(with coordinate: CLLocationCoordinate2D) {
        let lookAroundSceneRequest = MKLookAroundSceneRequest(coordinate: coordinate)
        
        Task {
            do {
                guard let lookAroundScene = try await lookAroundSceneRequest.scene else {
                    print("LookAround data is not available for the location.")
                    return
                }
                lookAroundViewController?.scene = lookAroundScene
            } catch {
                print("Error fetching LookAround scene: \(error)")
            }
        }
    }
    
    //this function randomizes the multiple choices
    func randomizedChoices(){
        var indexes: [Int] = [1, 2, 3, 4]
        //the array below is a copy of Cities
        var cityOptions = Cities.map { $0.copy() as! City }
        var usedCountries: [String] = []
        //the while loop below essentially gets a random intex, a random City, and the text for the random City's country is assigned to the button of the corresponding index
        while(!indexes.isEmpty)
        {
            let randomIndex = indexes.randomElement()!
            let randIndexLoc = indexes.firstIndex(of: randomIndex)!
            
            var randCity = cityOptions.randomElement()
            
            //while loop below should prevent repeats in the country options
            while(usedCountries.contains(randCity!.country)){
                randCity = cityOptions.randomElement()
            }
            
            //if both arrays are the same size, then this is the first iteration of the loop. At this point, the current City (correct answer) should be set as one of the choices
            if(Cities.count == cityOptions.count){
                randCity = currentCity
            }
            
            let randCityLoc = cityOptions.firstIndex(of: randCity!)
            
            switch randomIndex {
            case 1:
                buttonA.setTitle("A) \(randCity!.country)", for: .normal)
            case 2:
                buttonB.setTitle("B) \(randCity!.country)", for: .normal)
            case 3:
                buttonC.setTitle("C) \(randCity!.country)", for: .normal)
            case 4:
                buttonD.setTitle("D) \(randCity!.country)", for: .normal)
            default:
                print("something went wrong")
            }
            usedCountries.append(randCity!.country)
            
            //remove random index from indexes
            let removed = indexes.remove(at: randIndexLoc)
            let cityRemoved = cityOptions.remove(at: randCityLoc!)
        }
    }
    
    
    @IBAction func hintBtnTapped(_ sender: Any) {
        //print("hint button tapped")
        let cc = nameToCountryCode(currentCity!.country)
        print(cc)
        let urlString = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(cc)?rapidapi-key=" + api_key
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        DispatchQueue.main.async { [weak self] in
            // Explicitly hide the webView before loading the new content
            self?.flagWebView.isHidden = true
            self?.flagWebView.navigationDelegate = self
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data else { print("❌ Data is nil"); return }
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                if let jsonDictionary = jsonDictionary as? [String: Any],
                    let data = jsonDictionary["data"] as? [String: Any],
                    let flagImageUri = data["flagImageUri"] as? String,
                    let imageURL = URL(string: flagImageUri) {
                    print(flagImageUri)

                    if let flagUrl = URL(string: flagImageUri) {
                        let req = URLRequest(url: flagUrl)
                        DispatchQueue.main.async { [weak self] in
                            self?.flagWebView.load(req)
                        }
                    } else {
                        print("Invalid URL")
                    }
                } else {
                    print("❌ Unable to extract Flag Image URI from JSON")
                }
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    // WKNavigationDelegate method to handle when the web view finishes loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // This will be called when the web view finishes loading the request
        DispatchQueue.main.async { [weak self] in
            self?.flagWebView.isHidden = false
        }
    }
    

    func initializeCurrentCity() {
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
                return
            }
            else{
                viewedCities.append(currentCity!)
            }
        }
        if let city = currentCity {
            fetchLookAroundScene(with: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude))
        }
    }

    
    
    @IBAction func scoresBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "quizToScores", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //reset global variables and refresh other things
        currentQuestion = 1
        correctAnswers = 0
        wrongAnswers = 0
        viewedCities = []
        
        if lookAroundViewController == nil {
            if let lookAroundVC = self.children.compactMap({ $0 as? MKLookAroundViewController }).first {
                self.lookAroundViewController = lookAroundVC
            }
        }
        
        // Initialize the current city and fetch its Look Around scene
        initializeCurrentCity()
        randomizedChoices()
        
        // Other UI setups
        flagWebView.isHidden = true
        feedbackLabel.text = ""
        NomorecityLabel.text = ""
        
        // Handle hard mode setup if necessary
        if let mode = hardMode {
            print("HARD MODE IS: ", mode)
            hintBtn.isHidden = mode ? true : false
        }
    }
    
//    func updateCityImage() {
//        guard let imageUrlString = currentCity?.imageUrl,
//              let imageUrl = URL(string: imageUrlString) else {
//            print("Invalid image URL")
//            return
//        }
//
//
//        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
//            guard let data = data, let image = UIImage(data: data) else { return }
//            DispatchQueue.main.async {
//                self.cityImageView.image = image
//            }
//        }.resume()
//    }
    
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


