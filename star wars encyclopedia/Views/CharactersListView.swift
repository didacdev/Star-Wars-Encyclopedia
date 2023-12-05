
//
//  ContentView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 1/12/23.
//

import SwiftUI

struct CharactersListView: View {
    
    @State var peopleList: [Person] = []
    @State var page: Int = 1
    
    var body: some View {
        
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                HeadingView()
                Spacer()
                
                NavigationView {
                    ZStack{
                        Color("Background")
                            .edgesIgnoringSafeArea(.all)
                        
                        List(peopleList, id: \.name) { person in
                            BadgeView(person: person)
                        }
                        .frame(width: nil)
                        .onAppear() {
                            
                            StarWarsApi(paramenter: String(page)).loadPerson { result in
                                
                                switch result {
                                case .success(let peopleList):
                                    self.peopleList = peopleList
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                .background(Color("Background"))
                
                Spacer()
                
                PagesView(actualPage: String(page), page: $page, peopleList: $peopleList)
                
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
    CharactersListView()
}
