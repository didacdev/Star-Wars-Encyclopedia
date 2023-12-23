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
    @Binding var isLoading: Bool
    @Binding var isPresented: Bool
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Button {
                
                if page > 1 {
                    
                    page -= 1
                    searchText = ""
                    getPeople()
                }
                
            } label: {
                Text("Back")
                    .font(.custom("Raleway-Medium", size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.bar)
                    .accessibilityAddTraits(.isButton)
            }
            .frame(
                width: 90,
                height: 43
            )
            .background(Color.background, in: RoundedRectangle(cornerRadius: 40))
            .accessibilityLabel("Back")
            .accessibilityHint("Go back")
            
            
            Text(actualPage)
                .font(.custom("Raleway-Medium", size: 24))
                .fontWeight(.medium)
                .frame(
                    width: 90,
                    height: 43
                )
                .foregroundColor(Color("Dark"))
                .background(.white, in: RoundedRectangle(cornerRadius: 40))
                .accessibilityAddTraits(.isSummaryElement)
                .accessibilityLabel("Current page")
            
            Button {
                
                if page < 9 {
                    page += 1
                    searchText = ""
                    getPeople()
                }
                
                
            } label: {
                Text("Next")
                    .font(.custom("Raleway-Medium", size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.bar)
                    .accessibilityAddTraits(.isButton)
            }
            .frame(
                width: 90,
                height: 43
            )
            .background(Color.background, in: RoundedRectangle(cornerRadius: 40))
            .accessibilityLabel("Next")
            .accessibilityHint("Go next")
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
        isLoading = true
        
        StarWarsApi().loadPeople(page: String(page)) { result in
            
            switch result {
            case .success(let peopleList):
                isLoading = false
                self.peopleList = peopleList
            case .failure(let error):
                print(error)
                isLoading = false
                isPresented = true
            }
        }
    }
}

#Preview {
    PagesView(
        actualPage: "1",
        page: .constant(1),
        peopleList: .constant([]),
        isLoading: .constant(false),
        isPresented: .constant(false),
        searchText: .constant("")
    )
}

