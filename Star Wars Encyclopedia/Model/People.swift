//
//  Character.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import Foundation

struct PeopleList: Decodable {
    
    let results: [Person]
}

struct Person: Decodable {
    
    let name: String
    let birth_year: String
    let eye_color: String
    let gender: String
    let hair_color: String
    let height: String
    let mass: String
    let skin_color: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let url: String
    let created: String
    let edited: String
    
}

struct Attribute {
    let name: String
    let value: [String]
}

