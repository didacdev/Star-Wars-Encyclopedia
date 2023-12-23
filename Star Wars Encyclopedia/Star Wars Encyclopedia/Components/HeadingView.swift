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
            Text("STAR WARS")
                .font(.custom("Raleway-Medium", size: 20))
                .foregroundColor(Color.subheading)
            Text("CHARACTERS")
                .font(.custom("Poppins-ExtraBold", size: 35))
                .foregroundColor(Color.heading)
                .accessibilityAddTraits(.isHeader)
            Text("Star Wars characters")
                .font(.custom("Aurek-Besh", size: 8))
                .foregroundColor(Color.subheading)
                .accessibilityHint("Header in Aurek-Besh font")
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
