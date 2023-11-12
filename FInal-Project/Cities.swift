//
//  Cities.swift
//  FInal-Project
//
//  Created by Kevin Infante on 11/11/23.
//
import Foundation

//City class, objects will be cities with attributes: name, latitude, longitude, country, etc.

class City: Equatable {
    //func below allows for comparison (==) between cities
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name && lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude && lhs.country == rhs.country
    }
    
    var name: String
    var latitude: Double
    var longitude: Double
    var country: String
    
    init(name: String, latitude: Double, longitude: Double, country: String){
        self.name = name; self.latitude = latitude; self.longitude = longitude
        self.country = country
    }
}

var Cities = [miami, nyc, sanFran, barca, paris]

var miami = City(name: "Miami", latitude: 25.7617, longitude: -80.1918, country: "United States of America")
var nyc = City(name: "New York City", latitude: 40.75780, longitude: -73.9855, country: "United States of America")
var sanFran = City(name: "San Francisco", latitude: 37.7749, longitude: -122.4194, country: "Unites States of America")

var barca = City(name: "Barcelona", latitude: 41.3874, longitude: 2.1686, country: "Spain")
var paris = City(name: "Paris", latitude: 48.8566, longitude: 2.3522, country: "France")


