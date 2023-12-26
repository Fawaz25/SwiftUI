import SwiftUI

struct PopUps: View {
    @State private var isShowingFirstPopup = true
    @State private var isShowingSecondPopup = false
    @State private var isProfileViewPresented = false

    var body: some View {
        NavigationView{
            ZStack {
                Color(hex: "5DB075").edgesIgnoringSafeArea(.all)
                
                VStack {
                    if isShowingFirstPopup {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 363)
                            .cornerRadius(10)
                            .overlay(
                                VStack {
                                    Text("Congratulations!")
                                        .font(.title)
                                        .bold()
                                        .padding(.bottom, 5)
                                    
                                    Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt.")
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 20)
                                        .font(.subheadline)
                                    //                                    .padding(.vertical, 20)
                                    Spacer()
                                    Button(action: {
                                        // Action for the green button
                                        isShowingFirstPopup = false
                                        isShowingSecondPopup = true
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
                                    .padding()
                            )
                            .zIndex(isShowingFirstPopup ? 1 : 0)
                            .transition(.opacity)
                    }
                    
                    if isShowingSecondPopup {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 355, height: 427)
                            .cornerRadius(10)
                            .overlay(
                                VStack {
                                    HStack{
                                        ForEach(0..<5) { _ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                                .imageScale(.large)
                                        }
                                    }
                                    Spacer().frame(height: 20)
                                    //                                padding()
                                    
                                    Text("Rate our app")
                                        .font(.title)
                                        .bold()
                                        .padding(.bottom, 5)
                                    
                                    Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt.")
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 38)
                                        .font(.subheadline)
                                    //                                    .padding(.vertical, 10)
                                    Spacer().frame(height: 35)
                                    
                                    Button(action: {
                                        isProfileViewPresented = true
                                    }) {
                                        Text("I love it!")
                                            .fontWeight(.medium)
                                            .font(.body)
                                            .bold()
                                            .frame(width: 327, height: 50)
                                            .background(Color(hex: "5DB075"))
                                            .foregroundColor(.white)
                                            .cornerRadius(40)
                                    }
                                    .fullScreenCover(isPresented: $isProfileViewPresented) {
                                        Dashboard() // Replace ProfileView() with the view you want to present
                                    }
                                    Button(action: {
                                        isShowingFirstPopup = true
                                        isShowingSecondPopup = false
                                    }) {
                                        Text("Don't Like the app? Let us know")
                                            .foregroundColor(Color(hex: "5DB075"))
                                            .bold()
                                        
                                    }
                                    
                                }
                            )
                            .zIndex(isShowingSecondPopup ? 1 : 0)
                            .transition(.opacity)
                    }
                }
            }
        }
    }
    
}


#Preview{
    PopUps()
}


