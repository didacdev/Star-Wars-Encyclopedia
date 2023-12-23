
//
//  ContentView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 1/12/23.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct CharactersListView: View {
    @StateObject var charactersListViewModel = CharactersListViewModel()
    @State private var searchDebounceTimer: Timer?
    
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
                            
                            if charactersListViewModel.isLoading {
                                Spacer()
                                ProgressView()
                                    .scaleEffect(2)
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                
                                List(charactersListViewModel.peopleList, id: \.name) { person in
                                    
                                    HStack {
                                        BadgeView(person: person)
                                            .accessibilityValue(person.name)
                                            .accessibilityLabel("Character")
                                            .accessibilityHint("Link to character info")
                                    }
                                    .overlay(
                                        NavigationLink(destination: CharacterDetailView(person: person)) {
                                            EmptyView()
                                        }
                                            .padding()
                                            .accessibilityAddTraits(.isButton)
                                            .accessibilityHint("show character info")
                                    )
                                    .listRowBackground(Color("Background"))
                                }
                                .frame(width: nil)
                                .searchable(
                                    text: $charactersListViewModel.searchText,
                                    placement: .navigationBarDrawer(displayMode: .always),
                                    prompt: "Search character"
                                )
                                .onChange(of: charactersListViewModel.searchText) {
                                    searchDebounceTimer?.invalidate()
                                    searchDebounceTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                        
                                        if charactersListViewModel.searchText.isEmpty {
                                            charactersListViewModel.isLoading = true
                                            
                                            charactersListViewModel.loadPeople()
                                            
                                        } else {
                                            charactersListViewModel.searchPeople()
                                        }
                                    }
                                }
                                .onAppear() {
                                    
                                    if charactersListViewModel.searchText.isEmpty && charactersListViewModel.peopleList.isEmpty {
                                        
                                        charactersListViewModel.isLoading = true
                                        
                                        charactersListViewModel.loadPeople()
                                    }
                                }
                                .listStyle(PlainListStyle())
                                .accessibilityLabel("Characters list")
                                .accessibilityHint("Shows a list with all the characters of the current page")
                            }
                            
                            Spacer()
                            
                            PagesView(
                                actualPage: String(charactersListViewModel.page),
                                page: $charactersListViewModel.page,
                                peopleList: $charactersListViewModel.peopleList,
                                isLoading: $charactersListViewModel.isLoading,
                                isPresented: $charactersListViewModel.isPresented,
                                searchText: $charactersListViewModel.searchText
                            )
                            .padding(.top)
                            
                        }
                        .ignoresSafeArea(.keyboard)
                    }
                }
            }
            .alert(isPresented: $charactersListViewModel.isPresented, content: {
                Alert(title: Text("Connection error"),
                      message: Text("Star Wars Encyclopedia can't connect to the database"),
                      dismissButton: Alert.Button.default(Text("Close"))
                )
            })
        }
    }
}

#Preview {
    CharactersListView()
}
