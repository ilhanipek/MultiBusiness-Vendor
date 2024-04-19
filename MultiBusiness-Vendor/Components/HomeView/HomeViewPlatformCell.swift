//
//  HomeViewCell.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 29.03.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeViewPlatformCell: View {
  @State var vendorType: VendorType
    var body: some View {
      VStack {

        WebImage(url: URL(string: vendorType.logo))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.screenWidth / 3, height: Constants.screenWidth / 4.5)

        // else

        Text(vendorType.name)
            .font(.customfont(.regular, fontSize: Constants.screenWidth / 20))
                .foregroundColor(.black)

      }
      .padding()
      .background(Color.gray.opacity(0.7))
      .cornerRadius(10)
      .overlay(
          RoundedRectangle(cornerRadius: 10)
              .stroke(lineWidth: 0.6)
              .foregroundColor(Color.gray.opacity(0.6))
      )
      .frame(width: Constants.screenWidth / 2.1, height: Constants.screenWidth / 2.2, alignment: .center)
      .shadow(radius: 5)
    }
}

//#Preview {
//  HomeViewPlatformCell()
//}