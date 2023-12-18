import SwiftUI

struct SignUp: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isChecked: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing:15) {
                
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Spacer().frame(height: 15)
                TextField("Name", text: $name)
                    .font(.body)
                    .frame(maxWidth: 320, maxHeight: 30)
                    .foregroundColor(.black)
                    .frame(height: 44)
                    .padding(.horizontal, 12)
                    .background(Color(hex: "F6F6F6"))
                    .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
//                Spacer().frame(height: 20)
                TextField("Email", text: $email)
                    .font(.body)
                    .font(.system(size: 17, weight: .thin))
                    .frame(maxWidth: 320, maxHeight: 30)
                    .foregroundColor(.black)
                    .frame(height: 44)
                    .padding(.horizontal, 12)
                    .background(Color(hex: "F6F6F6"))
                    .cornerRadius(4.0)
                    .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
//                Spacer().frame(height: 20)
                TextField("Password", text: $password)
                    .font(.body)
                    .font(.system(size: 17, weight: .thin))
                    .frame(maxWidth: 320, maxHeight: 30)
                    .foregroundColor(.black)
                    .padding(.horizontal, 12)
                    .frame(height: 44)
                    .background(Color(hex: "F6F6F6"))
                    .cornerRadius(4.0)
                    .overlay(
                        ZStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    // Action for the button (if needed)
                                }) {
                                    Text("Show")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color(hex: "5DB075"))
                                }
                                .padding(.trailing, 12)
                                
                            }
                        }
                        
                    )
                Spacer().frame(height: 2)
                HStack{
                    Button(action: {
                        isChecked.toggle()
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 15, height: 15) // Adjust the size as needed
                                .foregroundColor(isChecked ? Color(hex: "5DB075") : Color(hex: "E8E8E8"))
                                .cornerRadius(4) // Adjust the corner radius as needed
                            
                            if isChecked {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                            }
                        }
                    }
                    .padding(.leading, 25)
                    .padding(.top, -15)
                    //                .padding(.vertical, 10)
                    Text("I would like to receive your newsletter and other promotional information.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color(.gray))
                        .lineSpacing(-10)
                        .kerning(-1)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 5)
                    //                       .padding(.vertical, 8)
                    Spacer()
                }
                
                Spacer().frame(height: 15)
                Button(action: {}) {
                    Text("Sign Up")
                        .fontWeight(.medium)
                        .font(.body)
                        .frame(maxWidth: 320, maxHeight: 30)
                        .padding()
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color(hex: "5DB075"))
                        .cornerRadius(40)
                }
                Button(action:{}){
                    Text("Forgot yout password?")
                        .fontWeight(.semibold)
                        .font(.body)
                        .frame(maxWidth: 320, maxHeight: 30)
                        .foregroundColor(Color(hex: "5DB075"))
                        .cornerRadius(40)
                }
                .navigationBarItems(
                    leading: Button(action: {
                        // Action for the 'X' button
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .imageScale(.small)
                            .padding(.leading,5)
                            .padding(.top,25)
                    },
                    trailing: NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(Color(hex:"5DB075"))
                            .padding(.trailing,10)
                            .padding(.top,25)

                    }
                )
            }.padding(.top,-310)
        }

    }
}

struct LoginView: View {
    var body: some View {
        // Your login view content goes here
        Text("Log In")
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
