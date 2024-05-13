//
//  SearcViewCell.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 31.03.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchViewVendorCell: View {

  let vendor: Vendor
  var body: some View {
    ZStack{
      RoundedRectangle(cornerRadius: 8)
        .stroke(lineWidth: 0.1)

        .foregroundStyle(Color.black)
        .frame(width: Constants.screenWidth / 2.2, height: Constants.screenWidth / 2.2, alignment: .center)
      ZStack {
        Color.white
        VStack {
          ZStack{
            HStack{
              WebImage(url: URL(string: "\(vendor.featureImage)"))
                .resizable()
            }
            HStack{
              VStack(spacing: 5){
                Spacer()
                if let deliveryTime = vendor.deliveryTime {
                  HStack {
                    Image("delivery_car")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .symbolRenderingMode(.multicolor)
                      .foregroundStyle(Color.white)
                    Text("\(deliveryTime) min")
                      .foregroundStyle(Color.white)
                  }
                  .font(.customfont(.regular, fontSize: Constants.screenWidth / 30))
                  .padding(.horizontal,2.5)
                  .background{
                    RoundedRectangle(cornerRadius: 10)
                      .foregroundStyle(Color.custom.darkGray.opacity(0.4))
                  }
                  .padding(EdgeInsets(top: Constants.screenWidth / 30, leading: Constants.screenWidth / 45, bottom: 0, trailing: 0))
                }

                if let prepareTime = vendor.prepareTime {
                  HStack {
                    Image("prepare_time")
                      .resizable()
                      .aspectRatio(contentMode: .fit)

                    Text("\(prepareTime) min")
                      .foregroundStyle(Color.white)
                  }
                  .font(.customfont(.regular, fontSize: Constants.screenWidth / 30))
                  .padding(.horizontal,vendor.prepareTime == nil ? 0 : 2.5)
                  .background{
                    RoundedRectangle(cornerRadius: 10)
                      .foregroundStyle(Color.custom.darkGray.opacity(0.4))
                  }
                  .padding(EdgeInsets(top: Constants.screenWidth / 30, leading: Constants.screenWidth / 45, bottom: 0, trailing: 0))
                }
              }
              Spacer()
            }
          }

          VStack(alignment: .leading){
            HStack{
              VStack(alignment: .leading){
                Text("\(vendor.name)")
                  .font(.customfont(.medium, fontSize: Constants.screenWidth / 20))
                Text("\(vendor.description)")
                  .foregroundStyle(Color.custom.darkGray)
                  .lineLimit(1)
                HStack(alignment: .bottom,spacing: 2){
                  Text("\(vendor.rating)")
                  Image(systemName: "star.fill")
                    .renderingMode(.template)
                  Text("(\(vendor.reviewsCount))")
                }
                .font(.customfont(.medium, fontSize: Constants.screenWidth / 20))
                .foregroundStyle(Color.yellow)

                HStack{
                  if vendor.delivery == 1 {
                    Text("Delivery")
                      .padding(.horizontal,5)
                      .padding(.vertical,2)
                      .background{
                        RoundedRectangle(cornerRadius: 10)
                          .foregroundStyle(Color.yellow)
                      }
                  }
                  if vendor.pickup == 1 {
                    Text("Pick Up")
                      .padding(.horizontal,5)
                      .padding(.vertical,2)
                      .background{
                        RoundedRectangle(cornerRadius: 10)
                          .foregroundStyle(Color.custom.darkBlue)
                      }
                  }
                }
                Spacer()
              }
              Spacer()
            }
          }
          .padding(.leading,10)
        }
      }
      .clipShape(RoundedRectangle(cornerRadius: 8))
      .frame(width: Constants.screenWidth / 2.2, height: Constants.screenWidth / 2.2, alignment: .center)
    }
  }
}

#Preview {
  SearchViewVendorCell(vendor: Vendor.vendors.first!)
}
