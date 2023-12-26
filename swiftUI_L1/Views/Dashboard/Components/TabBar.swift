//
//  Tabbar.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 26/12/2023.
//

import SwiftUI


struct TabBar: View {
    @State private var selectedTab = 0
    var body: some View {
        VStack{
            switch selectedTab {
            case 0:
                Profile()
            case 1:
                Text("Second Tab Content")
            case 2:
                Text("Third Tab Content")
            case 3:
                Text("Fourth Tab Content")
            case 4:
                Text("Fifth Tab Content")
            default:
                Text("Default Content")
            }
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.01)) // Light gray color
                    .frame(width: 375, height: 70)
                
                    .overlay(
                        
                        HStack(spacing: 0) {
                            
                            ForEach(0..<5) { index in
                                Button(action: {
                                    selectedTab = index
                                }) {
                                    Circle()
                                        .frame(width: 29, height: 29)
                                        .foregroundColor(selectedTab == index ? Color(hex:"#5DB075") : Color(hex:"E8E8E8"))
                                }
                                .padding(.horizontal, 18) // Adjust horizontal padding as needed
                            }
                        }
                            .frame(height: 30)
                    )
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 0.1)
                            .frame(height: 1)
                            .offset(y: -42)
                    )
            }// Adjust height of the tab bar as needed
        }
    }
}

