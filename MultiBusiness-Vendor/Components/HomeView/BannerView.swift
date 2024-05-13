//
//  BannerView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 11.04.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerView: View {
  @State var banner: Banner

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 8)
        .stroke(lineWidth: 0.1)
        .frame(width: Constants.screenWidth / 2.5, height: Constants.screenWidth / 5, alignment: .center)

      WebImage(url: URL(string: banner.photo))
          .resizable()
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .frame(width: Constants.screenWidth/2.5, height: Constants.screenWidth / 5, alignment: .center)
    }
  }
}

#Preview {
  BannerView(banner: Banner.banners.first!)
}
