//
//  SettingsTopFiller.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 23.04.2024.
//

import SwiftUI

struct SettingsTopFiller: View {
  var body: some View {
    ZStack{
      RoundedRectangle(cornerRadius: 10)
      .foregroundStyle(Color.custom.primary)
      .ignoresSafeArea()
      HStack {
        VStack(alignment: .leading){
          Text("Settings")
            .foregroundStyle(Color.custom.background)
            .font(.customfont(.semibold, fontSize: Constants.screenHeight / 18))
          Text("Profile & App Settings")
            .foregroundStyle(Color.custom.background)
            .font(.customfont(.regular, fontSize: Constants.screenHeight / 50))
        }
        .padding(.leading,10)
        Spacer()
      }

    }
      .frame(width: Constants.screenWidth, height: Constants.screenHeight / 9, alignment: .center)
  }
}

#Preview {
    SettingsTopFiller()
}
