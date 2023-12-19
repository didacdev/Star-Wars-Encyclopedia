//
//  StarWarsAPI.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import Alamofire
import Foundation

final class StarWarsApi {
    
    func loadPeople(searchText: String = "", page: String = "1", completion: @escaping (Result<[Person], Error>) -> ())  {
        
        var url = "https://swapi.dev/api/people/"
        
        if page != "1" {
            url = "\(url)?page=\(page)"
        } else if searchText != ""{
            url = "\(url)?search=\(searchText)"
        }
        
        AF.request(url).responseDecodable(of: PeopleList.self) { response in
            
            switch response.result {
            case .success(let peopleList):
                completion(.success(peopleList.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadPlanet(url: String, completion: @escaping (Result<Planet, Error>) -> ()) {
        
        AF.request(url).responseDecodable(of: Planet.self) { response in
            switch response.result {
            case .success(let planet):
                completion(.success(planet))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    func loadSpecies(url: String, completion: @escaping (Result<Species, Error>) -> ()) {
        
        AF.request(url).responseDecodable(of: Species.self) { response in
            switch response.result {
            case .success(let species):
                completion(.success(species))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    func loadFilm(url: String, completion: @escaping (Result<Film, Error>) -> ()) {
        
        AF.request(url).responseDecodable(of: Film.self) { response in
            switch response.result {
            case .success(let film):
                completion(.success(film))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    func loadPlanetAndSpeciesAndFilms(planetURL: String, speciesURL: String, filmsURLs: [String], completion: @escaping (Result<(Planet, Species, [Film]), Error>) -> ()) {
        
        let group = DispatchGroup()

        var planetResult: Result<Planet, Error>?
        var speciesResult: Result<Species, Error>?
        var films: [Film] = []
        
        // loadPlanet
        group.enter()
        self.loadPlanet(url: planetURL) { result in
            planetResult = result
            group.leave()
        }

        // loadSpecies
        group.enter()
        self.loadSpecies(url: speciesURL) { result in
            speciesResult = result
            group.leave()
        }
        
        // loadFilm
        for URL in filmsURLs {
            group.enter()
            self.loadFilm(url: URL) { result in
                switch result {
                case .success(let film):
                    films.append(film)
                case .failure(let error):
                    print("Error: \(error)")
                }
                group.leave()
            }
        }
        
        
        group.notify(queue: .main) {
                // waiting for functions end
                switch (planetResult, speciesResult) {
                case (.success(let planet), .success(let species)):
                    completion(.success((planet, species, films)))
                case (.failure(let error), _), (_, .failure(let error)):
                    completion(.failure(error))
                default:
                    // Manejar cualquier otro caso
                    break
                }
            }
    }
    
}
