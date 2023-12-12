
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
    @State var isPresented: Bool = false
    
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
                        
                        VStack {
                            List(peopleList, id: \.name) { person in
                                
                                NavigationLink(destination: CharacterDetailView(person: person)) {
                                    BadgeView(person: person)
                                        .background(Color("Background"))
                                }
                                .listRowBackground(Color("Background"))
                                
                            }
                            .frame(width: nil)
                            .onAppear() {
                                
                                StarWarsApi(paramenter: String(page)).loadPerson { result in
                                    
                                    switch result {
                                    case .success(let peopleList):
                                        self.peopleList = peopleList
                                    case .failure(let error):
                                        print(error)
                                        isPresented = true
                                    }
                                }
                            }
                                .listStyle(PlainListStyle())
                            Spacer()
                            
                            PagesView(actualPage: String(page), page: $page, peopleList: $peopleList)
                                .padding(.top)
                        }
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
    CharactersListView()
}
