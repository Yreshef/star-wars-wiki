//
//  Film.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 01/08/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import Foundation

struct Film: Decodable {
    var title: String
    var episodeId: Int
    var openingCrawl: String
    var director: String
    var producer: String //    -- The name(s) of the producer(s) of this film. Comma separated.
    var releaseDate: String //    -- The ISO 8601 date format of film release at original creator country.
    var species: [String]
    var starships: [String]
    var vehicles: [String]
    var characters: [String]
    var planets: [String]
    var url: String
    var created: String
    var edited: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case species
        case starships
        case vehicles
        case characters
        case planets
        case url
        case created
        case edited
    }
}

