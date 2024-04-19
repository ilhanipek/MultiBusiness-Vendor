//
//  CountryCodeSelectionView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 9.04.2024.
//

import SwiftUI

struct CountryCodeSelectionView: View {
  @StateObject var authVM = AuthViewModel.shared
    var body: some View {

      ZStack{
        ScrollView{
          VStack{
            ForEach(CountryCode.countryCodes) { countryCode in
              VStack{
                Button {
                  authVM.countryCode = countryCode
                  authVM.isCountryCodeSelectionViewPresented = false
                } label: {
                  HStack{
                    Image(countryCode.image)
                    Text(countryCode.countryCode)
                    Text(countryCode.countryName)
                    Spacer()
                  }
                  .tint(Color.black)
                  .frame(minWidth: Constants.screenWidth)
                  .padding(.leading)
                }
                Divider()
              }
            }
          }
        }

      }
      .padding(.top)
    }
}

#Preview {
  CountryCodeSelectionView()
}
