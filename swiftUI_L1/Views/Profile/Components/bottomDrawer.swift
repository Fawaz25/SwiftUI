//
//  bottomDrawer.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 26/12/2023.
//

import SwiftUI


struct BottomSheetView: View{
    @State private var isPageTwoActive = false

    var body: some View{
        NavigationView {
            VStack(spacing: 20) {
                Spacer().frame(height: 5)
                Text("Drawer Header")
                    .bold()
                    .font(.title3)
                // Placeholder color
                
                Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation.")
                    .multilineTextAlignment(.center)
                // Placeholder color
                
                Button(action: {
                    // Action for the green button
                    isPageTwoActive = true
                }) {
                    Text("Click Me")
                        .fontWeight(.medium)
                        .font(.body)
                        .bold()
                        .frame(width: 327, height: 50)
                        .background(Color(hex:"5DB075"))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                    
                }
                
                
                Text("Secondary Action")
                    .foregroundColor(Color(hex: "5DB075"))
                    .bold()
            }
            .fullScreenCover(isPresented: $isPageTwoActive) {
                PopUps()
           
            
        }
        
        }
        
    }
}

#Preview {
    BottomSheetView()
}
