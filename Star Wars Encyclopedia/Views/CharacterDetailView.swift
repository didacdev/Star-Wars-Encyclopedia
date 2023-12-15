//
//  CharacterDetailView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var person: Person
    @State var planetName: String = ""
    @State var isPresented: Bool = false
    @State var attributes: [Attribute] = []
    
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
                        
                        VStack (alignment: .leading, spacing: 20){
                            
                            UpperBarView()
                            
                            List (attributes, id: \.name) { attribute in
                                DetailView(text: "\(attribute.name): \(attribute.value)")
                                    .listRowBackground(Color("Background"))
                            }
                            .onAppear() {
                                
                                StarWarsApi(page: "1",
                                            url: person.homeworld
                                ).loadPlanet { result in
                                    
                                    switch result {
                                    case .success(let planet):
                                        self.planetName = planet.name
                                        print(planetName)
                                    case .failure(let error):
                                        print(error)
                                        isPresented = true
                                    }
                                    
                                    attributes.append(Attribute(name: "NAME", value: person.name))
                                    attributes.append(Attribute(name: "BIRTH", value: person.birth_year))
                                    attributes.append(Attribute(name: "GENRE", value: person.gender))
                                    attributes.append(Attribute(name: "SPECIES", value: person.species))
                                    attributes.append(Attribute(name: "PLANET", value: planetName))
                                    attributes.append(Attribute(name: "HEIGHT", value: person.height))
                                    attributes.append(Attribute(name: "FILMS", value: person.films))
                                }
                            }
                            .listStyle(PlainListStyle())
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
            "https://swapi.dev/api/films/1/"],
        species: ["https://swapi.dev/api/species/1/"],
        starships: ["https://swapi.dev/api/starships/12/"],
        vehicles: ["https://swapi.dev/api/vehicles/14/"],
        url: "https://swapi.dev/api/people/1/",
        created: "2014-12-09T13:50:51.644000Z",
        edited: "2014-12-10T13:52:43.172000Z"
    ))
}
