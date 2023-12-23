//
//  CharactersListViewModel.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 23/12/23.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    @Published var peopleList: [Person] = []
    @Published var page: Int = 1
    @Published var searchText: String = ""
    @Published var isPresented: Bool = false
    @Published var isLoading: Bool = false

    private var apiService: StarWarsApi

    init(apiService: StarWarsApi = StarWarsApi()) {
        self.apiService = apiService
    }

    func loadPeople() {
        isLoading = true
        apiService.loadPeople(page: String(page)) { result in
            switch result {
            case .success(let peopleList):
                self.isLoading = false
                self.peopleList = peopleList
            case .failure(let error):
                self.isLoading = false
                print(error)
                self.isPresented = true
            }
        }
    }

    func searchPeople() {
        apiService.loadPeople(searchText: searchText) { result in
            switch result {
            case .success(let peopleList):
                self.isLoading = false
                self.peopleList = peopleList
            case .failure(let error):
                self.isLoading = false
                print(error)
                self.isPresented = true
            }
        }
    }
}
