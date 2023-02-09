//
//  CricketAPIRepository.swift
//  CricInfo
//
//  Created by bjit on 9/2/23.
//

import Foundation


import Foundation

enum CricketAPIResources: String {
    case fixtures, continents
    case countries, leagues
    case seasons, livescores, teams
    case players, career, lineup, bowling, batting
    case league, visitorteam, localteam, runs
}

enum CricketAPIFormat: String {
    case wookiee, json
}

enum CricketAPILeagueID: String{
    
    case T20I = "3"
    case BBL = "5"
    case T20C = "10"
}

enum CricketAPIFiterStatus: String{
    case Finished, NS
}

struct CricketAPIRepository {
    
    private init() {}
    static let shared = CricketAPIRepository()
    
    private let urlSession = URLSession.shared
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "cricket.sportmonks.com"
        return urlComponents
    }

     func getURL(with resources: CricketAPIResources, parameters: [String: String])-> URL? {
        var urlComponents = self.urlComponents
        urlComponents.path = "/api/v2.0/\(resources)"
        urlComponents.setQueryItems(with: parameters)
        guard let url = urlComponents.url else {
            return nil
        }
    return url
    }
    
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
}

//https://swapi.co/api/films?format=json


// https://swapi.co/api/people?search=Obi%20Wan%20Kenobi&format=wookiee
//CricketAPIRepository.shared.searchData(with: .people, format: .wookiee, search: "Obi Wan Kenobi") { (data, error) in
// Convert JSON Data to Object
//}
