//
//  DetailView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import SwiftUI

struct DetailView: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Raleway-Medium", size: 22))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

#Preview {
    DetailView(text: "SUB HEADING")
}
