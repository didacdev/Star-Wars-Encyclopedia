//
//  PagesView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 3/12/23.
//

import SwiftUI

struct PagesView: View {
    var body: some View {
        HStack {
            PageButtonView(selected: true, pageNumber: "1")
            PageButtonView(selected: false, pageNumber: "2")
            PageButtonView(selected: false, pageNumber: "3")
            PageButtonView(selected: false, pageNumber: "4")
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
    PagesView()
}
