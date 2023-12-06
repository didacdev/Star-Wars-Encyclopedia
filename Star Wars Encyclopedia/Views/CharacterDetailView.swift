//
//  CharacterDetailView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @State var person: Person
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                BadgeView(person: person)
                Spacer()
                VStack (alignment: .leading, spacing: 20){
                    UpperBarView()
                    DetailView(text: "SUB HEADING")
                    DetailView(text: "SUB HEADING")
                    DetailView(text: "SUB HEADING")
                    DetailView(text: "SUB HEADING")
                    DetailView(text: "SUB HEADING")
                    DetailView(text: "SUB HEADING")
                    DetailView(text: "SUB HEADING")
                    DetailView(text: "SUB HEADING")
                }
                .padding()
                Spacer()
                
            }
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
