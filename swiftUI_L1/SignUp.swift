import SwiftUI

struct SignUp: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isChecked: Bool = false
    @State private var isEmailValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var isPasswordVisible = false

    
    var body: some View {
        NavigationView {
            VStack(spacing:15) {
                
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
//                    .padding(.top,10)
                
                Spacer().frame(height: 15)
                TextField("Name", text: $name)
                    .font(.body)
                    .frame(maxWidth: 320, maxHeight: 30)
                    .foregroundColor(.black)
                    .autocapitalization(.words)
                    .frame(height: 44)
                    .padding(.horizontal, 12)
                    .background(Color(hex: "F6F6F6"))
                    
                    .overlay(
                            RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 0.2)
                            )

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

                ZStack(alignment: .trailing) {
                           if isPasswordVisible {
                               TextField("Password", text: $password)
                                   .font(.body)
                                   .font(.system(size: 17, weight: .thin))
                                   .frame(maxWidth: 320, maxHeight: 30)
                                   .foregroundColor(.black)
                                   .padding(.horizontal, 12)
                                   .frame(height: 44)
                                   .background(
                                   RoundedRectangle(cornerRadius: 4.0)
                                    .stroke(Color.gray, lineWidth: 0.2)
                                       .background(Color(hex: "F6F6F6"))
                                                       )
                                   .textContentType(.password)
                           } else {
                               SecureField("Password", text: $password)
                                   .font(.body)
                                   .font(.system(size: 17, weight: .thin))
                                   .frame(maxWidth: 320, maxHeight: 30)
                                   .foregroundColor(.black)
                                   .padding(.horizontal, 12)
                                   .frame(height: 44)
                                   .background(
                                   RoundedRectangle(cornerRadius: 4.0)
                                    .stroke(Color.gray, lineWidth: 0.2)
                                       .background(Color(hex: "F6F6F6"))
                                   )
                           }
                           
                           Button(action: {
                               isPasswordVisible.toggle()
                           }) {
                               Text(isPasswordVisible ? "Hide" : "Show")
                               .font(.callout)
                               .fontWeight(.medium)
                               .foregroundColor(Color(hex: "5DB075"))
                               .padding(.trailing,12)
                           }
                       }
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
                                .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color(hex: "F6F6F6"), lineWidth: 0.2) // Adjust the stroke color and width as needed
                            )
                             
                                    
                            
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
                        .lineLimit(2) // Set the maximum number of lines to 2
                        .fixedSize(horizontal: false, vertical: true) // Allow vertical expansion
                        .kerning(-1)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 5)
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
                            .padding(.leading,10)
                            .padding(.top,12)
                    },
                    trailing: NavigationLink(destination: Login()) {
                        Text("Login")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(Color(hex:"5DB075"))
                            .padding(.trailing,10)
                            .padding(.top,12)

                    }
                )
            }
            

        }
        .padding(.bottom,330)

        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}




