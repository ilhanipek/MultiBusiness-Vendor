//
//  VendorTypeViewTopFiller.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 23.04.2024.
//

import SwiftUI

struct VendorTypeViewTopFiller: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @StateObject var vendorTypeViewModel = VendorTypeViewModel.shared
  var body: some View {
    ZStack{
      RoundedRectangle(cornerRadius: 10)
      .foregroundStyle(Color.custom.primary)
      .ignoresSafeArea()
      HStack{
        Button {
          mode.wrappedValue.dismiss()
        } label: {
          Image(systemName: "xmark")
            .resizable()
            .foregroundStyle(Color.custom.background)
            .frame(width: Constants.screenWidth / 20, height: Constants.screenWidth / 20, alignment: .center)
            .padding(Constants.screenWidth/18)
        }
        Spacer()
      }
      .padding(.top,Constants.screenWidth / 10)
        VStack(alignment: .center){
          Text(vendorTypeViewModel.vendorType?.name ?? "")
              .font(.customfont(.bold, fontSize: Constants.screenWidth/14))
              .foregroundStyle(Color.custom.background)
        }
        .padding(.leading,10)
        .padding(.top,Constants.screenWidth / 10)
    }
      .frame(width: Constants.screenWidth, height: Constants.screenHeight / 9, alignment: .center)
  }
}

#Preview {
  VendorTypeViewTopFiller()
}
