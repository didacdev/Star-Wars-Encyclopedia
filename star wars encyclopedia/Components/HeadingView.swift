//
//  HeadingView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 2/12/23.
//

import SwiftUI

struct HeadingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Characters")
                .font(.custom("Poppins-ExtraBold", size: 30))
            Text("Characters")
                .font(.custom("Aurek-Besh", size: 20))
        }
        
    }
}

#Preview {
    HeadingView()
}
