//
//  CouponTopFiller.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 5.05.2024.
//

import SwiftUI

struct CouponTopFiller: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  var coupon: Coupon

  func copyCouponText() {
    UIPasteboard.general.string = coupon.code
  }

  var body: some View {
    ZStack{
      RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(Color(uiColor: UIColor(hex: coupon.color)!))
        .ignoresSafeArea()
      VStack {
        HStack {
          Button {
            mode.wrappedValue.dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .resizable()
              .foregroundStyle(Color.custom.background)
              .frame(width: Constants.screenWidth / 25, height: Constants.screenWidth / 16, alignment: .center)
          }
          .padding(.leading)
          Spacer()
          Text(coupon.code)
            .font(.customfont(.bold, fontSize: Constants.screenWidth / 10))
            .foregroundStyle(Color.custom.background)
          Spacer()
          Button {
            copyCouponText() // Kupon metnini kopyala işlevini çağırın
          } label: {
            Image(systemName: "square.on.square")
              .resizable()
              .foregroundStyle(Color.custom.background)
              .frame(width: Constants.screenWidth / 14, height: Constants.screenWidth / 16, alignment: .center)
              .padding(.trailing)
          }
        }
        .padding(.top,Constants.screenHeight / 17)
        Spacer()
        Text(coupon.description)
          .font(.customfont(.regular, fontSize: Constants.screenWidth / 17))
          .foregroundStyle(Color.custom.background)
          .padding(.bottom,20)
      }
    }
    .ignoresSafeArea()
    .frame(width: Constants.screenWidth, height: Constants.screenHeight / 7, alignment: .center)

  }
}


#Preview {
  CouponTopFiller(coupon: Coupon.coupons.first!)
}
