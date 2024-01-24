//
//  NavBar.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 26/12/2023.
//

import SwiftUI
struct NavBar: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text("Settings")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color(hex:"#FFFFFF"))
                    .padding(.leading, 0)
                
                Spacer()
                
                Text("Profile")
                    .font(.title)
                    .foregroundColor(Color(hex:"FFFFFF"))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: Login()) {
                    Text("Logout")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex:"FFFFFF"))
                        .padding(.trailing, 0)
                }
            }
            .frame(width: geometry.size.width)
                    .background(Color(hex:"5DB075")) // Change the background color if needed
        }
    }
}

#Preview {
    NavBar()
}
