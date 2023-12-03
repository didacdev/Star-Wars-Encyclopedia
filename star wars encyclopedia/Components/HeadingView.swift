//
//  HeadingView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 2/12/23.
//

import SwiftUI

struct HeadingView: View {
    var body: some View {
            
        VStack (alignment: .leading) {
            Text("LIST OF")
                .font(.custom("Raleway-Medium", size: 20))
            .foregroundColor(Color.subheading)
            Text("CHARACTERS")
                .font(.custom("Poppins-ExtraBold", size: 35))
            .foregroundColor(Color.heading)
            Text("List of characters")
                .font(.custom("Aurek-Besh", size: 8))
                .foregroundColor(Color.subheading)
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}

#Preview {
    HeadingView()
}
