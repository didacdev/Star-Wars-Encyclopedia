//
//  DetailView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import SwiftUI

struct DetailView: View {
    
    var text: String
    var content: [String]
    
    var body: some View {
        HStack (alignment: .top){
            Text("\(text): ")
                .accessibilityLabel("Detail")
                .accessibilityValue(text)
            VStack (alignment:.leading, spacing: 16){
                
                ForEach(content, id: \.hashValue) { item in
                    Text(item)
                        .accessibilityLabel("Detail content")
                        .accessibilityValue(item)
                }
            }
            
            
        }
        .font(.custom("Raleway-Medium", size: 22))
        .fontWeight(.bold)
        .foregroundColor(.white)
        
    }
}

#Preview {
    DetailView(text: "SUB HEADING", content: ["sub heading1", "sub heading2"])
}
