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
    var imageUrl: String
    
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name && lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude && lhs.country == rhs.country
    }
    
    var name: String
    var latitude: Double
    var longitude: Double
    var country: String
    
    init(name: String, latitude: Double, longitude: Double, country: String, imageUrl: String = "Path to image") {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
        self.imageUrl = imageUrl
    }
    
    func copy() -> Any {
        let copy = City(name: name, latitude: latitude, longitude: longitude, country: country, imageUrl: imageUrl)
        return copy
    }
}

var Cities = [miami, nyc, sanFran, barca, paris, berlin, tokyo, toronto, london, taipei, singapore, athens, sydney, vienna, montreal, athens, cpnhgn]

var miami = City(name: "Miami", latitude: 25.7617, longitude: -80.1918, country: "United States of America", imageUrl: "https://example.com/path/to/miami.jpg")
var nyc = City(name: "New York City", latitude: 40.75780, longitude: -73.9855, country: "United States of America", imageUrl: "https://example.com/path/to/nyc.jpg")
var sanFran = City(name: "San Francisco", latitude: 37.7749, longitude: -122.4194, country: "United States of America", imageUrl: "Path to image")
//51.5007° N, 0.1246° W
//51.5045° N, 0.0865° W
var barca = City(name: "Barcelona", latitude: 41.3874, longitude: 2.1686, country: "Spain", imageUrl: "Path to image")
var paris = City(name: "Paris", latitude: 48.8566, longitude: 2.3522, country: "France", imageUrl: "Path to image")
var berlin = City(name: "Berlin", latitude: 52.5200, longitude: 13.4050, country: "Germany", imageUrl: "Path to image")
//35.6764° N, 139.6500° E
var tokyo = City(name: "Tokyo", latitude: 35.6800, longitude: 139.7693, country: "Japan", imageUrl: "Path to image")
//43.6532° N, 79.3832° W
var toronto = City(name: "Toronto", latitude: 43.6438, longitude: -79.3892, country: "Canada", imageUrl: "Path to image")

var london = City(name: "London", latitude: 51.4980, longitude: -0.1436, country: "United Kingdom", imageUrl: "Path to image")


//cdmx doesn't work, don't know why. It should be supported
var cdmx = City(name: "Mexico City", latitude: 19.4354, longitude: -99.1502, country: "Mexico")
var sydney = City(name: "Sydney", latitude: -33.8688, longitude: 151.2093, country: "Australia")
var singapore = City(name: "Singapore", latitude: 1.2792, longitude: 103.8527, country: "Singapore")
var athens = City(name: "Athens", latitude: 37.9839, longitude: 23.7275, country: "Greece")
var taipei = City(name: "Taipei", latitude: 25.0330, longitude: 121.5654, country: "Taiwan")

var montreal = City(name: "Montreal", latitude: 45.5019, longitude: -73.5674, country: "Canada")
var vienna = City(name: "Vienna", latitude: 48.2082, longitude: 16.3719, country: "Austria")
var cpnhgn = City(name: "Copenhagen", latitude: 55.6761, longitude: 12.5683, country: "Denmark")


