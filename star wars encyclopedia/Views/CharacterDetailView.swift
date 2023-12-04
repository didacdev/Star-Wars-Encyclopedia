//
//  CharacterDetailView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import SwiftUI

struct CharacterDetailView: View {
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                BadgeView(text: "NAME")
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
    CharacterDetailView()
}
