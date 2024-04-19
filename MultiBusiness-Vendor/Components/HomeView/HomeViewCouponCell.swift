//
//  HomeViewCouponCell.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 10.04.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeViewCouponCell: View {
  @State var coupon: Coupon

    var body: some View {
        HStack{
          WebImage(url: URL(string: coupon.photo))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 70, height: 70)

          VStack(alignment: .leading){
            Text(coupon.code)
              .font(.customfont(.bold, fontSize: Constants.screenWidth/22))
            Text(coupon.description)
              .font(.customfont(.semibold, fontSize: Constants.screenWidth/25))
              .lineLimit(2)
          }
          .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .padding(15)
        .frame(width: Constants.screenWidth / 1.8, height: 100)
        .background(Color(uiColor: UIColor(hex: coupon.color)!))
        .cornerRadius(16)
    }
}

#Preview {
  HomeViewCouponCell(coupon: Coupon(id: 1, code: "COUPON", color: "#e32400", description: "sdlkfmlskdjflskdfjslf", discount: "", minOrderAmount: "", maxCouponAmount: "", percentage: "", expiresOn: "", times: "", isActive: "", forDelivery: false, creatorID: "", vendorTypeID: "", createdAt: "", updatedAt: "", deletedAt: "", formattedExpiresOn: "", useLeft: 100, expired: false, photo: "\(Constants.bananaUrl)"))
}
