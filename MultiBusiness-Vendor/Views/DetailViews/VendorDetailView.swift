//
//  VendorDetailView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 2.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct VendorDetailView: View {
  var vendor : Vendor
  var body: some View {
    ZStack {
      Color.custom.background
        .ignoresSafeArea()
      VStack {
        VendorDetailTopFillerView(text: "", isSearching: false, vendor: vendor) {
          // On commit
        }

        HStack {
          WebImage(url: URL(string: vendor.logo))
            .resizable()
            .frame(width: Constants.screenWidth / 3, height: Constants.screenWidth / 3, alignment: .center)
            .padding(.top,Constants.screenWidth / 18)
            .padding(.leading,5)
          
          VStack {
            HStack{
              if vendor.delivery == 1 {
                Text("Delivery")
                  .foregroundStyle(Color.white)
                  .padding(.horizontal,5)
                  .padding(.vertical,2)
                  .background{
                    RoundedRectangle(cornerRadius: 10)
                      .foregroundStyle(Color.cyan)
                  }
              }
              if vendor.pickup == 1 {
                Text("Pick Up")
                  .foregroundStyle(Color.white)
                  .padding(.horizontal,5)
                  .padding(.vertical,2)
                  .background{
                    RoundedRectangle(cornerRadius: 10)
                      .foregroundStyle(Color.custom.darkBlue)
                  }
              }
              if vendor.isOpen == true {
                Text("Open")
                  .foregroundStyle(Color.white)
                  .padding(.horizontal,5)
                  .padding(.vertical,2)
                  .background{
                    RoundedRectangle(cornerRadius: 10)
                      .foregroundStyle(Color.orange)
                  }
              }
              Spacer()
            }
            .padding(.top,25)

            VStack(alignment: .leading) {
              HStack {
                if let deliveryTime = vendor.deliveryTime {
                  HStack {
                    Image("delivery_car")
                      .renderingMode(.template)
                      .resizable()
                      .frame(width: 30, height: 30, alignment: .center)
                      .aspectRatio(contentMode: .fit)
                      .foregroundStyle(Color.white)
                    Text("\(deliveryTime) min")
                      .foregroundStyle(Color.white)
                  }
                  .background{
                    RoundedRectangle(cornerRadius: 10)
                      .foregroundStyle(Color.custom.primary)
                  }
                }

                if let prepareTime = vendor.prepareTime {
                  HStack {
                    Image("prepare_time")
                      .renderingMode(.template)
                      .resizable()
                      .frame(width: 30, height: 30, alignment: .center)
                      .aspectRatio(contentMode: .fit)
                      .foregroundStyle(Color.white)
                    Text("\(prepareTime) min")
                      .foregroundStyle(Color.white)
                  }
                  .background{
                    RoundedRectangle(cornerRadius: 10)
                      .foregroundStyle(Color.custom.primary)
                  }
                }
                Spacer()
              }
            }
            HStack {
              Text(vendor.description)
              Spacer()
            }
          }
          Spacer()
        }

        HStack {
          Text("Categories")
            .font(.customfont(.bold, fontSize: Constants.screenWidth / 15))
            .bold()
            .padding(.leading,5)
            .padding(.top,20)
          Spacer()
        }

        // Categories

        HStack {
          Text("Products")
            .font(.customfont(.bold, fontSize: Constants.screenWidth / 15))
            .bold()
            .padding(.leading,5)
            .padding(.top,20)
          Spacer()
        }
        Spacer()
      }
    }
  }
}

#Preview {
  VendorDetailView(vendor: Vendor.vendors.first!)
}
