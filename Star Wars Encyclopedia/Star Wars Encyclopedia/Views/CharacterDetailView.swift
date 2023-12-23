//
//  CharacterDetailView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var person: Person
    @State var isPresented: Bool = false
    @State var attributes: [Attribute] = []
    @State var planetName: String = ""
    @State var speciesName: String = ""
    @State var films: [String] = []
    @State var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                BadgeView(person: person)
                
                NavigationView {
                    
                    ZStack{
                        Color("Background").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        VStack (spacing: 20){
                            
                            UpperBarView()
                            
                            if isLoading {
                                Spacer()
                                ProgressView()
                                    .scaleEffect(2)
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                Spacer()
                            } else {
                                List (attributes, id: \.name) { attribute in
                                    DetailView(text: attribute.name, content: attribute.value)
                                        .listRowBackground(Color("Background"))
                                        .accessibilityLabel("Detail")
                                        .accessibilityValue(attribute.name)
                                }
                                .onAppear() {
                                    
                                    if attributes.isEmpty {
                                        isLoading = true
                                        
                                        StarWarsApi().loadPlanetAndSpeciesAndFilms(
                                            planetURL: person.homeworld,
                                            speciesURL: person.species.first ?? "https://swapi.dev/api/species/1/",
                                            filmsURLs: person.films
                                        ) { result in
                                            switch result {
                                            case .success(let (planet, species, films)):
                                                isLoading = false
                                                planetName = planet.name
                                                speciesName = species.name
                                                self.films = films.map { "- Episode \($0.episode_id): \($0.title)" }
                                            case .failure(let error):
                                                isLoading = false
                                                print(error)
                                                isPresented = true
                                            }
                                            
                                            self.attributes.append(Attribute(name: "NAME", value: [person.name]))
                                            self.attributes.append(Attribute(name: "SPECIES", value: [speciesName]))
                                            self.attributes.append(Attribute(name: "PLANET", value: [planetName]))
                                            self.attributes.append(Attribute(name: "BIRTH", value: [person.birth_year]))
                                            self.attributes.append(Attribute(name: "GENRE", value: [person.gender]))
                                            self.attributes.append(Attribute(name: "HEIGHT", value: [person.height]))
                                            self.attributes.append(Attribute(name: "FILMS", value: films))
                                        }
                                    }
                                }
                                .listStyle(PlainListStyle())
                                .accessibilityLabel("Characters detail list")
                                .accessibilityHint("Shows a list with all the character's details")
                            }
                            
                            LowerBarView()
                        }
                        .padding()
                    }
                }
            }
            .alert(isPresented: $isPresented, content: {
                Alert(title: Text("Connection error"),
                      message: Text("Star Wars Encyclopedia can't connect to the database"),
                      dismissButton: Alert.Button.default(Text("Close"))
                )
            })
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
    }
}

#Preview {
    CharacterDetailView(person: Person(
        name: "Luke Skywalker",
        birth_year: "19 BBY",
        eye_color: "Blue",
        gender: "Male",
        hair_color: "Blond",
        height: "172",
        mass: "77",
        skin_color: "Fair",
        homeworld: "https://swapi.dev/api/planets/1/",
        films: [
            "https://swapi.dev/api/films/1/",
            "https://swapi.dev/api/films/2/"],
        species: [],
        starships: ["https://swapi.dev/api/starships/12/"],
        vehicles: ["https://swapi.dev/api/vehicles/14/"],
        url: "https://swapi.dev/api/people/1/",
        created: "2014-12-09T13:50:51.644000Z",
        edited: "2014-12-10T13:52:43.172000Z"
    ))
}
