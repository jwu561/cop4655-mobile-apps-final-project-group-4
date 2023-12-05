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

var Cities = [miami, nyc, sanFran, barca, paris, berlin, tokyo, toronto, london, taipei, singapore, athens, sydney, vienna, montreal, cpnhgn, osaka, tampa, prague, cologne, jerusalem, rome, brussels, venice, kristiansand, stockholm, bruges, hiroshima, lyon, helsinki, ottowa, christchurch, jurong, fiorentino, budapest, odense, geneva, vaduz, balzers, gibraltar, warsaw, lublin, madrid, lisbon, amstrdm, hong, zagreb, valcia, porto, ljblj, andorra, frank]
//var Cities = [madrid, frank, toronto, montreal, rome, fiorentino]

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


//var Cities = [osaka, dublin, tampa, prague, cologne, jerusalem]

var osaka = City(name: "Osaka", latitude: 34.672314, longitude: 135.484802, country: "Japan")
var dublin = City(name: "Dublin", latitude: 53.9897, longitude: 7.3633, country: "Ireland")
var tampa = City(name: "Tampa", latitude: 27.964157, longitude: -82.452606, country: "United States of America")
var prague = City(name: "Prague", latitude: 50.0755, longitude: 14.4378, country: "Czech Republic")
var cologne = City(name: "Cologne", latitude: 50.9375, longitude: 6.9603, country: "Germany")
var jerusalem = City(name: "Jerusalem", latitude: 31.7683, longitude: 35.2137, country: "Israel")

//var Cities = [rome, brussels, venice, kristiansand, stockholm, bruges, hiroshima, lyon, helsinki, ottowa, ontario]

var rome = City(name: "Rome", latitude: 41.9028, longitude: 12.4964, country: "Italy")
var brussels = City(name: "Brussels", latitude: 50.8476, longitude: 4.3572, country: "Belgium")
var venice = City(name: "Venice", latitude: 45.4408, longitude: 12.3155, country: "Italy")
var kristiansand = City(name: "Kristiansand", latitude: 58.1599, longitude: 8.0182, country: "Norway")
var stockholm = City(name: "Stockholm", latitude: 59.3293, longitude: 18.0686, country: "Sweden")
var bruges = City(name: "Bruges", latitude: 51.2092, longitude: 3.2248, country: "Belgium")
var hiroshima = City(name: "Hiroshima", latitude: 34.3853, longitude: 132.4553, country: "Japan")
var lyon = City(name: "Lyon", latitude: 45.7640, longitude: 4.8357, country: "France")
var helsinki = City(name: "Helsinki", latitude: 60.1699, longitude: 24.9384, country: "Finland")
var ottowa = City(name: "Ottowa", latitude: 45.4215, longitude:  -75.6972, country: "Canada")
//var ontario = City(name: "Ontario", latitude: 51.2538, longitude:  -85.3232, country: "Canada")

var christchurch = City(name: "Christchurch", latitude: -43.5320, longitude:  172.6306, country: "New Zealand")
var jurong = City(name: "Jurong", latitude: 1.3368 , longitude:  103.6942, country: "New Zealand")
var fiorentino = City(name: "serravalle", latitude: 43.9690, longitude:  12.4774, country: "San Marino")
var budapest = City(name: "Budapest", latitude: 47.4979 , longitude:  19.0402, country: "Hungary")
var odense = City(name: "Odense", latitude: 55.4038 , longitude:  10.4024, country: "Denmark")

var geneva = City(name: "Geneva", latitude: 46.2044, longitude:  6.1432, country: "Switzerland")
var vaduz = City(name: "Vaduz", latitude: 47.1410 , longitude:  9.5209, country: "Liechtenstein")
var balzers = City(name: "Balzers", latitude: 47.0656 , longitude:  9.5075, country: "Liechtenstein")
var gibraltar = City(name: "Gibraltar", latitude: 36.1408 , longitude:  -5.3536, country: "United Kingdom")
var warsaw = City(name: "Warsaw", latitude: 52.2297 , longitude:  21.0122, country: "Poland")
var lublin = City(name: "Lublin", latitude: 51.2465 , longitude:  22.5684, country: "Poland")


var madrid = City(name: "Madrid", latitude: 40.4168, longitude: -3.7038, country: "Spain")
var lisbon = City(name: "Lisbon", latitude: 38.7223, longitude: -9.1393, country: "Portugal")
var zagreb = City(name: "Zagreb", latitude: 45.8150, longitude: 15.9819, country: "Croatia")
var amstrdm = City(name: "Amsterdam", latitude: 52.3676, longitude: 4.9041, country: "The Netherlands")
var hong = City(name: "Hong Kong", latitude: 22.3193, longitude: 114.1694, country: "China")

var andorra = City(name: "Andorra la Vella", latitude: 42.5063, longitude: 1.5218, country: "Andorra")
var ljblj = City(name: "Ljubljiana", latitude: 46.0565, longitude: 14.5058, country: "Slovenia")
var valcia = City(name: "Valencia", latitude: 39.4699, longitude: -0.3763, country: "Spain")
var porto = City(name: "Porto", latitude: 41.1579, longitude: -8.6291, country: "Portugal")
var frank = City(name: "Frankfurt", latitude: 50.1109, longitude: 8.6821, country: "Germany")



func nameToCountryCode(_ countryName: String) -> String {
    switch countryName {
    case "United States of America":
        return "US"
    case "Spain":
        return "ES"
    case "France":
        return "FR"
    case "Germany":
        return "DE"
    case "Japan":
        return "JP"
    case "Canada":
        return "CA"
    case "United Kingdom":
        return "GB"
    case "Australia":
        return "AU"
    case "Singapore":
        return "SG"
    case "Greece":
        return "GR"
    case "Taiwan":
        return "TW"
    case "Austria":
        return "AT"
    case "Denmark":
        return "DK"
    case "Ireland":
        return "IE"
    case "Czech Republic":
        return "CZ"
    case "Israel":
        return "IL"
        // Additional countries
    case "Italy":
        return "IT"
    case "Poland":
        return "PL"
    case "Norway":
        return "NO"
    case "Liechtenstein":
        return "LI"
    case "Belgium":
        return "BE"
    case "Sweden":
        return "SE"
    case "Finland":
        return "FI"
    case "San Marino":
        return "SM"
    case "Hungary":
        return "HU"
    case "New Zealand":
        return "NZ"
    case "Portugal":
        return "PT"
    case "Slovenia":
        return "SI"
    case "China":
        return "CN"
    case "Croatia":
        return "HR"
    case "Andorra":
        return "AD"
    case "Switzerland":
        return "CH"
    case "The Netherlands":
        return "NL"
    default:
        // Handle cases for other countries if needed
        return "Unknown"
    }
}

