//
//  PagesView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 3/12/23.
//

import SwiftUI

struct PagesView: View {
    
    let actualPage: String
    @Binding var page: Int
    @Binding var peopleList: [Person]
    
    var body: some View {
        HStack {
            Button {
                
                if page > 1 {
                    
                    page -= 1
                    
                    getPeople()
                }
                
            } label: {
                Text("Back")
                    .font(.custom("Raleway-Medium", size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.bar)
            }
            .frame(
                width: 90,
                height: 43
            )
            .background(Color.background, in: RoundedRectangle(cornerRadius: 40))
            
            Text(actualPage)
                .font(.custom("Raleway-Medium", size: 24))
                .fontWeight(.medium)
                .frame(
                    width: 90,
                    height: 43
                )
                .foregroundColor(Color("Dark"))
                .background(.white, in: RoundedRectangle(cornerRadius: 40))
            
            Button {
                
                if page < 9 {
                    page += 1
                    getPeople()
                }
                
            } label: {
                Text("Next")
                    .font(.custom("Raleway-Medium", size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.bar)
            }
            .frame(
                width: 90,
                height: 43
            )
            .background(Color.background, in: RoundedRectangle(cornerRadius: 40))
        }
        .padding(.all, 3)
        .background(Color.background)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.bar, lineWidth: 2)
        )
    }
    
    func getPeople() {
        StarWarsApi().loadPeople(page: String(page)) { result in
            
            switch result {
            case .success(let peopleList):
                self.peopleList = peopleList
            case .failure(let error):
                print(error)
            }
        }
    }
}

#Preview {
    PagesView(actualPage: "1", page: .constant(1), peopleList: .constant([]))
}
