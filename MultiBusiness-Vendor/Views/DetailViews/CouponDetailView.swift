//
//  CouponDetailView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 5.05.2024.
//

import SwiftUI

struct CouponDetailView: View {
  var coupon: Coupon
  @State var text: String = ""
    var body: some View {
      ZStack {
        Color.custom.background
          .ignoresSafeArea()
        VStack(alignment: .center) {
          CouponTopFiller(coupon: coupon)
          VStack {
            Text("Coupon can be use with most products without")
            Text("restrictions")
          }
          .font(.customfont(.regular, fontSize: Constants.screenWidth / 22))
          .bold()
          .frame(width: Constants.screenWidth - 10, alignment: .center)
          Spacer()
        }
      }
      .navigationBarBackButtonHidden()
    }
}

#Preview {
  CouponDetailView(coupon: Coupon.coupons.first!)
}
