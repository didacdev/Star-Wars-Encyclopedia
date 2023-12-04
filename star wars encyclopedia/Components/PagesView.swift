//
//  PagesView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 3/12/23.
//

import SwiftUI

struct PagesView: View {
    
    @State var actualPage: String
    
    var body: some View {
        HStack {
            PageButtonView(selected: false, pageNumber: "Back")
            PageButtonView(selected: true, pageNumber: actualPage)
            PageButtonView(selected: false, pageNumber: "Next")
        }
        .padding(.all, 3)
        .background(Color.background)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.bar, lineWidth: 2)
        )
    }
}

#Preview {
    PagesView(actualPage: "1")
}
