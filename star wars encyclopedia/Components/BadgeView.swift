//
//  BadgeView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 2/12/23.
//

import SwiftUI

struct BadgeView: View {
    
    @State var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            UpperBarView()
            Text(text)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .font(.custom("Raleway-Medium", size: 35))
                .padding(.all)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                
            Text(text)
                .foregroundColor(Color.subheading)
                .font(.custom("Aurek-Besh", size: 10))
                .padding([.leading, .bottom, .trailing])
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                
            LowerBarView()
        }
        .background(.labelBackground)
        
    }
}

#Preview {
    BadgeView(text: "Name")
}
