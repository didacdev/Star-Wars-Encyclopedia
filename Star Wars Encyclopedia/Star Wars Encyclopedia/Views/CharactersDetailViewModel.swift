//
//  CharactersDetailViewModel.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 23/12/23.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var person: Person
    @Published var attributes: [Attribute] = []
    @Published var planetName: String = ""
    @Published var speciesName: String = ""
    @Published var films: [String] = []
    @Published var isLoading: Bool = false
    @Published var isPresented: Bool = false

    private var apiService: StarWarsApi

    init(person: Person, apiService: StarWarsApi = StarWarsApi()) {
        self.person = person
        self.apiService = apiService
    }

    func loadPlanetAndSpeciesAndFilms() {
        isLoading = true
        apiService.loadPlanetAndSpeciesAndFilms(
            planetURL: person.homeworld,
            speciesURL: person.species.first ?? "https://swapi.dev/api/species/1/",
            filmsURLs: person.films
        ) { result in
            switch result {
            case .success(let (planet, species, films)):
                self.isLoading = false
                self.planetName = planet.name
                self.speciesName = species.name
                self.films = films.map { "- Episode \($0.episode_id): \($0.title)" }
            case .failure(let error):
                self.isLoading = false
                print(error)
                self.isPresented = true
            }

            self.attributes.append(Attribute(name: "NAME", value: [self.person.name]))
            self.attributes.append(Attribute(name: "SPECIES", value: [self.speciesName]))
            self.attributes.append(Attribute(name: "PLANET", value: [self.planetName]))
            self.attributes.append(Attribute(name: "BIRTH", value: [self.person.birth_year]))
            self.attributes.append(Attribute(name: "GENRE", value: [self.person.gender]))
            self.attributes.append(Attribute(name: "HEIGHT", value: [self.person.height]))
            self.attributes.append(Attribute(name: "FILMS", value: self.films))
        }
    }
}
