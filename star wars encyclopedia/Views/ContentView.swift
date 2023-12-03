
//
//  ContentView.swift
//  star wars encyclopedia
//
//  Created by Diego Sánchez on 1/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                HeadingView()
                Spacer()
                VStack (spacing: 0){
                    BadgeView()
                    BadgeView()
                    BadgeView()
                    BadgeView()
                }
                Spacer()
                PagesView()
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
        
    }
    
//    init() {
//        for familiy in UIFont.familyNames {
//            print(familiy)
//            for font in UIFont.fontNames(forFamilyName: familiy) {
//                print("-- \(font)")
//            }
//        }
//    }
}

#Preview {
    ContentView()
}
