//
//  PageButtonView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 3/12/23.
//

import SwiftUI

struct PageButtonView: View {
    
    @State var selected: Bool
    var pageNumber: String
    
    var body: some View {
        
        if selected {
            Button {
                
            } label: {
                Text(pageNumber)
                    .font(.custom("Raleway-Medium", size: 24))
                    .foregroundColor(.background)
            }
            .frame(
                width: 90,
                height: 43
            )
            .background(Color.white, in: RoundedRectangle(cornerRadius: 40))
        } else {
            Button {
                
            } label: {
                Text(pageNumber)
                    .font(.custom("Raleway-Medium", size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.bar)
            }
            .frame(
                width: 90,
                height: 43
            )
            .background(Color.background, in: RoundedRectangle(cornerRadius: 40))
            
        }
        
    }
}

#Preview {
    PageButtonView(selected: false, pageNumber: "1")
}
