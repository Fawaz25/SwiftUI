//
//  ProfileView.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 08/01/2024.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
       
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()

            Text("First Name Last Name")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    ProfileView()
}
