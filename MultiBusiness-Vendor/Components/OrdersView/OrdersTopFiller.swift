//
//  OrdersTopFiller.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 9.04.2024.
//

import SwiftUI

struct OrdersTopFiller: View {
    var body: some View {
      ZStack{
        RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(Color.custom.primary)
        .ignoresSafeArea()
        Text("Orders")
          .font(.customfont(.regular, fontSize: Constants.screenHeight / 45))
          .foregroundStyle(Color.white)

      }
        .frame(width: Constants.screenWidth, height: Constants.screenHeight / 25, alignment: .center)
    }
}

#Preview {
  OrdersTopFiller()
}
