
//
//  ContentView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 1/12/23.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct CharactersListView: View {
    @State  var searchText: String = ""
    @State var peopleList: [Person] = []
    @State var page: Int = 1
    @State  var isPresented: Bool = false
    @State private var searchDebounceTimer: Timer?
    @State var isLoading: Bool = false
    
    // Init background search field
    init() {
        
        coloredNavAppearance.backgroundColor = UIColor(named: "Background")
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
    
    var body: some View {
        
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                
                HeadingView()
                
                NavigationView {
                    
                    ZStack {
                        
                        Color("Background")
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            
                            if isLoading {
                                Spacer()
                                ProgressView()
                                    .scaleEffect(2)
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                
                                List(peopleList, id: \.name) { person in
                                    
                                    HStack {
                                        BadgeView(person: person)
                                    }
                                    .overlay(
                                        NavigationLink(destination: CharacterDetailView(person: person)) {
                                            EmptyView()
                                        }
                                            .padding()
                                    )
                                    .listRowBackground(Color("Background"))
                                }
                                .frame(width: nil)
                                .searchable(
                                    text: $searchText,
                                    placement: .navigationBarDrawer(displayMode: .always),
                                    prompt: "Search character"
                                )
                                .onChange(of: searchText) {
                                    searchDebounceTimer?.invalidate()
                                    searchDebounceTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                        
                                        isLoading = true
                                        
                                        StarWarsApi().loadPeople(searchText: searchText) { result in
                                            switch result {
                                            case .success(let peopleList):
                                                isLoading = false
                                                self.peopleList = peopleList
                                            case .failure(let error):
                                                isLoading = false
                                                print(error)
                                                isPresented = true
                                            }
                                        }
                                    }
                                }
                                .onAppear() {
                                    
                                    if searchText.isEmpty && peopleList.isEmpty {
                                        
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
                                .listStyle(PlainListStyle())
                            }
                            
                            Spacer()
                            
                            PagesView(actualPage: String(page), page: $page, peopleList: $peopleList, isLoading: $isLoading, isPresented: $isPresented)
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
