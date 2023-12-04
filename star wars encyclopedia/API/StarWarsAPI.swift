//
//  StarWarsAPI.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import Alamofire

final class StarWarsApi {
    
    private var page: String
    
    init(paramenter: String) {
        
        if paramenter == "1" {
            self.page = ""
        } else {
            self.page = "?page=\(paramenter)"
        }
    }
    
    func loadPerson(completion: @escaping (Result<[Person], Error>) -> ())  {
        
        AF.request("https://swapi.dev/api/people/\(page)").responseDecodable(of: PeopleList.self) { response in
            
            switch response.result {
            case .success(let peopleList):
                completion(.success(peopleList.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
