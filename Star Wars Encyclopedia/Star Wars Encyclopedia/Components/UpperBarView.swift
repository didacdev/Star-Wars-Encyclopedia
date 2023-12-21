//
//  BarView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 4/12/23.
//

import SwiftUI

struct UpperBarView: View {
    var body: some View {
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
    }
}

#Preview {
    UpperBarView()
}
