import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var sC = ServiceController.shared
    @StateObject var authVM = AuthViewModel()
    @FocusState private var isTextFieldFocused: Bool
  
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                    Spacer()
                }

                VStack {
                    Text("Welcome Back")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)

                    Text("Login to continue")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, Constants.screenWidth * 0.1)

                    LineTextField(title: "Email", placholder: "Enter your email address", txt: $authVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom, Constants.screenWidth * 0.07)
                        .focused($isTextFieldFocused) // TextField odaklandığında klavye otomatik olarak açılır

                    LineSecureField(title: "Password", placholder: "Enter your password", txt: $authVM.txtPassword, isShowPassword: $authVM.isShowPassword)
                        .padding(.bottom, Constants.screenWidth * 0.02)

                    NavigationLink {
                        //ForgotPasswordView()
                    } label: {
                        Text("Forgot Password?")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryText)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, Constants.screenWidth * 0.03)

                    RoundButton(title: "Sign In") {
                        Task {
                            try? await FireBaseAuthService.shared.login(email: authVM.txtEmail, password: authVM.txtPassword)
                            mode.wrappedValue.dismiss()
                        }
                    }
                    .padding(.bottom, Constants.screenWidth * 0.05)

                    NavigationLink {
                        SignUpView()
                    } label: {
                        HStack{
                            Text("Don’t have an account?")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryText)

                            Text("Signup")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(Color.custom.primary)
                        }
                    }

                    Spacer()
                }
                .padding(20)
            }
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onDisappear(perform: {

        })
        .onTapGesture {
            // Herhangi bir yere tıklandığında TextField'ın odaklanmasını kapatır
            isTextFieldFocused = false
        }
    }
}

// Önizleme
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
