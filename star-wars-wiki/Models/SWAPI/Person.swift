//
//  Person.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 31/07/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import Foundation
struct Person: Decodable{
    var name: String
    var birthYear: String
    var eyeColor: String
    var gender: String
    var hairColor: String
    var height: String
    var mass: String
    var skinColor: String
    var homeworld: String
    var url: String
    var created: String
    var edited: String
    var films: [String]
    var species: [String]
    var starships: [String]
    var vehicles: [String]
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case gender
        case hairColor = "hair_color"
        case height
        case mass
        case skinColor = "skin_color"
        case homeworld
        case url
        case created
        case edited
        case films
        case species
        case starships
        case vehicles
    }
}

