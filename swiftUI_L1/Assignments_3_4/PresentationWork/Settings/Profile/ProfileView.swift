//
//  ProfileView.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 08/01/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
       
        VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,spacing: 10) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding([.top,.leading,.trailing])

            Text("Fawaz Ahmed")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
