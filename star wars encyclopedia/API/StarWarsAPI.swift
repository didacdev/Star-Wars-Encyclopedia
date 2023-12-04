//
//  StarWarsAPI.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import Alamofire

final class StarWarsApi {
    
    func loadCharacter(completion: @escaping (Result<[Character], Error>) -> ())  {
        
        AF.request("https://swapi.dev/api/people/").responseDecodable(of: CharacterList.self) { response in
            
            switch response.result {
            case .success(let characterList):
                completion(.success(characterList.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
