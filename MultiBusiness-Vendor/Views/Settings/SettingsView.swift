//
//  SettingsView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import SwiftUI

struct SettingsView: View {
  
  let firebaseAuthService = FireBaseAuthService.shared
  
    var body: some View {
      ZStack{
        Color.custom.background
          .ignoresSafeArea()
        VStack {
          SettingsTopFiller()
          ScrollView {
            
            ZStack {


              VStack(spacing: Constants.screenWidth / 18) {
                SettingsCell(image: "", text: "Edit Profile") {
                  
                }
                SettingsCell(image: "", text: "Change Password")
                SettingsCell(image: "", text: "Wallet")
                SettingsCell(image: "", text: "Favorites")
                Button {
                  // Deleting account
                } label: {
                  ZStack{
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .frame(width: Constants.screenWidth - 40, height: Constants.screenWidth / 8, alignment: .center)

                    HStack{
                      Image("")
                      Text("Delete Account")
                        .foregroundStyle(.red.opacity(0.8))
                      Spacer()
                      Image(systemName: "chevron.right")
                        .foregroundStyle(.red.opacity(0.8))
                    }
                    .padding(.horizontal,Constants.screenWidth / 15)
                  }
                  .foregroundStyle(Color.black)
                }
                
                Button {
                  FireBaseAuthService.shared.signOut()
                } label: {
                  ZStack{
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .frame(width: Constants.screenWidth - 40, height: Constants.screenWidth / 8, alignment: .center)

                    HStack{
                      Image("")
                      Text("Log Out")
                        .foregroundStyle(.red.opacity(0.8))
                      Spacer()
                      Image(systemName: "chevron.right")
                        .foregroundStyle(.red.opacity(0.8))
                    }
                    .padding(.horizontal,Constants.screenWidth / 15)
                  }
                  .foregroundStyle(Color.black)
                }
              }
            }
            .padding(.top,30)
          }
        }
      }

    }
}

#Preview {
    SettingsView()
}
