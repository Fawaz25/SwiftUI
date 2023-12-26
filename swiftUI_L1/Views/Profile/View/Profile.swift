//
//  Profile.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 25/12/2023.
//

import SwiftUI

struct Profile: View {
    @State var isShowingBottomSheet = false

    var body: some View {
        ZStack{
                VStack{
                    
                    ZStack(alignment: .top) {

                        Rectangle()
                            .foregroundColor(Color(hex: "5DB075"))
                            .edgesIgnoringSafeArea(.top)
                            .frame(height: 90)
                        
                        Button(action: {
                                // Action to perform when the image is clicked
                                
                            isShowingBottomSheet.toggle()

                            
                            }) {
                                Image("profile")
                                    .resizable()
                                    .frame(width: 158, height: 158) // Set circle size to 158x158
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                    .shadow(radius: 10)
                                    .offset(y: -25)
                        }
                            .sheet(isPresented: $isShowingBottomSheet) {
                                BottomSheetView()
                                    .presentationDetents([.height(295)])
                                    .presentationDragIndicator(.visible)
                                    .cornerRadius(50)
                            }
                        
                    }
                    VStack(spacing: 0) {
                        Text("Victoria Robertson")
                            .bold()
                            .font(.title)
                            .offset(y: -18)
                        Text("A mantra goes here")
                            .font(.body)
                            .bold()
                            .offset(y: -18)
                        SegmentControl()
                    }
                    
                }
                
        }
        
    }
}

#Preview {
    Profile()
}
