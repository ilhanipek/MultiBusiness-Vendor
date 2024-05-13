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
  @StateObject var vendorTypeVM = VendorTypeViewModel.shared

  @State var isPlatformPresented = false

  var body: some View {
    NavigationStack {
      ZStack{
        Color.custom.background
          .ignoresSafeArea()
        VStack{
          HomeTopFiller()
            .padding(.bottom,10)
          
          ScrollView(showsIndicators: false) {
            if let data = homeVM.banners?.data {
              ScrollView(.horizontal,showsIndicators: false ) {
                LazyHStack(content: {
                  ForEach(data,id: \.id ) { banner in
                    Button {
                        if let url = URL(string: banner.link) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        BannerView(banner: banner)
                    }
                  }
                })
              }
              .padding(.leading)
            }

            LazyVGrid(columns: gridItems, content: {
              ForEach(homeVM.vendorTypes, id: \.id) { vendorType in
                HomeViewPlatformCell(vendorType: vendorType, isPlatformPresented: $isPlatformPresented, didTap: {
                  vendorTypeVM.vendorType = vendorType
                  isPlatformPresented = true
                })
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
                ScrollView(.horizontal,showsIndicators: false) {
                  LazyHStack(content: {
                    ForEach(homeVM.coupons, id: \.id) { coupon in
                      NavigationLink {
                        CouponDetailView(coupon: coupon)
                      } label: {
                        HomeViewCouponCell(coupon: coupon)
                          .tint(.black)
                      }
                    }
                  })
                }
                .padding(.leading)
              }
            }
          }
          Spacer()
        }
      }
      .disabled(mainVM.isProgressing)
      .overlay(alignment: .center) {
        if mainVM.isProgressing == true{
          ZStack {
            Color.gray.opacity(0.7)
            CustomProgressView(isAnimating: $mainVM.isProgressing)
          }
          .ignoresSafeArea()
        }
      }
      .fullScreenCover(isPresented: $isPlatformPresented, onDismiss: {
        isPlatformPresented = false
      }, content: {
        VendorTypeView()
      })
    }
  }
}

#Preview {
    HomeView()
}
