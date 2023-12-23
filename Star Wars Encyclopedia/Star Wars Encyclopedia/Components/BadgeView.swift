//
//  BadgeView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 2/12/23.
//

import SwiftUI

struct BadgeView: View {
    
    let person: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            UpperBarView()
            Text(person.name.capitalized)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .font(.custom("Raleway-Medium", size: 35))
                .padding(.all)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .accessibilityLabel("Character name")
                .accessibilityAddTraits(.isHeader)
            
            Text(person.name)
                .foregroundColor(Color.subheading)
                .font(.custom("Aurek-Besh", size: 10))
                .padding([.leading, .bottom, .trailing])
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .accessibilityHint("Character name in Aurek-Besh font")
            
            
            LowerBarView()
        }
        .listRowBackground(Color("Background"))
        .background(.labelBackground)
        
    }
}

#Preview {
    BadgeView(person: Person(
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

