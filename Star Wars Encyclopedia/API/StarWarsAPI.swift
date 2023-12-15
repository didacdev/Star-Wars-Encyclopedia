//
//  StarWarsAPI.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import Alamofire

final class StarWarsApi {
    
    private var url: String
    
    init(page: String, url: String) {
        
        if page == "1" {
            self.url = url
        } else {
            self.url = "\(url)?page=\(page)"
        }
    }
    
    func loadPerson(completion: @escaping (Result<[Person], Error>) -> ())  {
        
        AF.request(url).responseDecodable(of: PeopleList.self) { response in
            
            switch response.result {
            case .success(let peopleList):
                completion(.success(peopleList.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadPlanet(completion: @escaping (Result<Planet, Error>) -> ()) {
        
        AF.request(url).responseDecodable(of: Planet.self) { response in
            switch response.result {
            case .success(let planet):
                completion(.success(planet))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
}
