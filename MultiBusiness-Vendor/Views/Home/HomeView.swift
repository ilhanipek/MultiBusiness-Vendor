//
//  HomeView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import SwiftUI

struct HomeView: View {
  @State var text : String = ""
  @State var isSearching : Bool = false
  let gridItems : [GridItem] = [
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1)
  ]

  @StateObject var homeVM = HomeViewModel.shared
  @StateObject var mainVM = MainViewModel.shared
  var body: some View {
    ZStack{
      Color.custom.background
      VStack{
        HomeTopFiller()
          .padding(.bottom,10)

        ScrollView {
          if let data = homeVM.banners?.data {
            ScrollView(.horizontal) {
              LazyHStack(content: {
                ForEach(data,id: \.id ) { banner in
                  BannerView(banner: banner)
                }
              })
            }
            .padding(.leading)
          }
          LazyVGrid(columns: gridItems, content: {
            ForEach(homeVM.vendorTypes, id: \.id) { vendorType in
              HomeViewPlatformCell(vendorType: vendorType)
            }
          })
          // Coupons
          if homeVM.coupons.count >= 1 {
            VStack {
              HStack {
                Text("Promo")
                  .font(.customfont(.medium, fontSize: Constants.screenWidth / 20))
                  .padding(.leading)
                Spacer()
              }
              ScrollView(.horizontal) {
                LazyHStack(content: {
                  ForEach(homeVM.coupons, id: \.id) { coupon in
                    HomeViewCouponCell(coupon: coupon)
                  }
                })
              }
              .padding(.leading)
            }
          }
          // Promotions
          HStack {
            Text("Featured Vendors")
              .font(.customfont(.medium, fontSize: Constants.screenWidth / 20))
              .padding(.leading,10)
            Spacer()
          }
        }
        Spacer()
      }
    }
    .overlay(alignment: .center) {
      if mainVM.isProgressing == true{
        ZStack {
          Color.gray.opacity(0.7)
          CustomProgressView(isAnimating: $mainVM.isProgressing)
        }
        .ignoresSafeArea()
      }
    }
  }
}


#Preview {
    HomeView()
}
