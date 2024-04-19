//
//  SignUpView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 9.04.2024.
//

import Foundation


import SwiftUI

struct SignUpView: View {

  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @StateObject var authVM = AuthViewModel.shared

  var body: some View {
    ZStack{
      VStack {
        HStack{
          Button {
            mode.wrappedValue.dismiss()
          } label: {
            Image("back")
              .resizable()
              .scaledToFit()
              .frame(width: 20, height: 20)
          }
          Spacer()
        }
        VStack{
          Spacer()

          Text("Join Us")
            .font(.customfont(.semibold, fontSize: 26))
            .foregroundColor(.primaryText)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 4)

          Text("Create an account now")
            .font(.customfont(.semibold, fontSize: 16))
            .foregroundColor(.secondaryText)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, Constants.screenWidth * 0.1)


          LineTextField( title: "Username", placholder: "Enter your username", txt: $authVM.txtUsername)
            .padding(.bottom, Constants.screenWidth * 0.07)

          LineTextField( title: "Email", placholder: "Enter your email address", txt: $authVM.txtEmail, keyboardType: .emailAddress)
            .padding(.bottom, Constants.screenWidth * 0.07)

          PhoneTextField(title: "Phone Number", placholder: "Enter your phone number", txt: $authVM.txtPhoneNumber, keyboardType: .numberPad, countryCode: $authVM.countryCode){
            authVM.isCountryCodeSelectionViewPresented = true 
          }

          LineSecureField( title: "Password", placholder: "Enter your password", txt: $authVM.txtPassword, isShowPassword: $authVM.isShowPassword)
            .padding(.bottom, Constants.screenWidth * 0.04)

          VStack {
            Text("By continuing you agree to our")
              .font(.customfont(.medium, fontSize: 14))
              .foregroundColor(.secondaryText)
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            HStack{

              Text("Terms of Service")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundStyle(Color.custom.primary)


              Text(" and ")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondaryText)


              Text("Privacy Policy.")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.custom.primary)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            }
            .padding(.bottom, Constants.screenWidth * 0.02)
          }
          RoundButton(title: "Sing Up") {
            Task {
              if authVM.txtUsername != "" && authVM.txtEmail != "" && authVM.txtPhoneNumber != "" && authVM.txtPassword != "" {
                try await FireBaseAuthService.shared.createUser(email: authVM.txtEmail, password: authVM.txtPassword, name: authVM.txtUsername, phone: authVM.txtPhoneNumber)
                mode.wrappedValue.dismiss()
              }
            }

          }
          .padding(.bottom, Constants.screenWidth * 0.05)

          NavigationLink {
            SignInView()
          } label: {
            HStack{
              Text("Already have an account?")
                .font(.customfont(.semibold, fontSize: 14))
                .foregroundColor(.primaryText)

              Text("Sign In")
                .font(.customfont(.semibold, fontSize: 14))
                .foregroundColor(.custom.primary)
            }
          }
          Spacer()
        }

        .padding(.horizontal, 20)
      }
    }
    .sheet(isPresented: $authVM.isCountryCodeSelectionViewPresented, onDismiss: {
      authVM.isCountryCodeSelectionViewPresented = false
    }, content: {
      CountryCodeSelectionView()
    })
    .navigationTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    .onDisappear(perform: {

    })
  }
}

#Preview {
    SignUpView()
}
