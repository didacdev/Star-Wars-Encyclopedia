//
//  BadgeView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 2/12/23.
//

import SwiftUI

struct BadgeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack (spacing: 0){
                Divider()
                    .frame(height: 2.0)
                    .background(Color.bar)
                HStack {
                    Divider()
                        .frame(width: 20.0, height: 2.0)
                        .background(Color.bar)
                    Spacer()
                    Divider()
                        .frame(width: 20.0, height: 2.0)
                        .background(Color.bar)
                }
            }
            
            Text("NAME")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .font(.custom("Raleway-Medium", size: 35))
                .padding(.all)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                
            Text("Name")
                .foregroundColor(Color.subheading)
                .font(.custom("Aurek-Besh", size: 10))
                .multilineTextAlignment(.leading)
                .padding([.leading, .bottom, .trailing])
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                
            VStack (spacing: 0){
                HStack {
                    Divider()
                        .frame(width: 20.0, height: 2.0)
                        .background(Color.bar)
                    Spacer()
                    Divider()
                        .frame(width: 20.0, height: 2.0)
                        .background(Color.bar)
                }
                Divider()
                    .frame(height: 2.0)
                    .background(Color.bar)
            }
        }
        .background(.labelBackground)
        
    }
}

#Preview {
    BadgeView()
}
