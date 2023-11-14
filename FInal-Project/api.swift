//
//  api.swift
//  FInal-Project
//
//  Created by Kevin Infante on 10/24/23.
//

import Foundation

let api_key = "0de85ba02dmsh43b73f514991d0bp13f7e1jsn43433488a041"

//make a struct that will access the different objects of the api response

////this was previously inside viewDidLoad{...} in viewController
//// the code below fetches info from an API
//// Create a search URL for fetching cities
//let url = URL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/cities/123214?rapidapi-key="+api_key)!
//let request = URLRequest(url: url)
//
//let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//
//    // Handle any errors
//    if let error = error {
//        print("❌ Network error: \(error.localizedDescription)")
//    }
//
//    // Make sure we have data
//    guard let data = data else {
//        print("❌ Data is nil")
//        return
//    }
//
//    do {
//        let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
//        print(jsonDictionary)
//    } catch {
//        print("❌ Error parsing JSON: \(error.localizedDescription)")
//    }
//}
