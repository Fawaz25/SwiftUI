import SwiftUI

struct Login: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isChecked: Bool = false
    @State private var isPasswordVisible = false
    @State private var isLoggedIn = false

    
    var body: some View {
        NavigationView {
            VStack(spacing:15) {
                HStack{
                    
               Spacer()
                Text("Log In")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    Spacer()
                }
                Spacer().frame(height: 15)
               
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
                
                Spacer().frame(height: 15)
                Button(action: {
                    isLoggedIn = true
                }) {
                    Text("Log In")
                        .fontWeight(.medium)
                        .font(.body)
                        .frame(maxWidth: 320, maxHeight: 30)
                        .padding()
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color(hex: "5DB075"))
                        .cornerRadius(40)
                }
                .fullScreenCover(isPresented: $isLoggedIn) {
                    Dashboard()
                }
                .padding(.bottom,510)

            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct Login_preview: PreviewProvider {
    static var previews: some View {
        Login()
    }
}



