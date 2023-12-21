//
//  Films.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 15/12/23.
//

import Foundation

struct FilmsList: Decodable {
    
    let results: [Film]
}

struct Film: Decodable {
    
    let title: String
    let episode_id: Int
    //    let characters: [String]
    //    let created: String
    //    let director: String
    //    let edited: String
    //    let opening_crawl: String
    //    let planets: [String]
    //    let producer: String
    //    let release_date: String
    //    let species: [String]
    //    let starships: [String]
    //    let url: String
    //    let vehicles: [String]
}
