//
//  SearchViewProductCell.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 13.04.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchViewProductCell: View {
  @State var product: Product
  var body: some View {
    ZStack{
      RoundedRectangle(cornerRadius: 8)
        .stroke(lineWidth: 0.3)
        .foregroundStyle(Color.custom.primary)
        .frame(width: Constants.screenWidth / 2.2, height: Constants.screenWidth / 3, alignment: .center)
      ZStack{
        Color.white
        HStack{
          WebImage(url: URL(string: "\(product.photo)"))
            .resizable()
            .frame(minWidth: Constants.screenWidth / 4.5 ,maxWidth: Constants.screenWidth / 4.5)
          VStack(alignment: .leading){
            Text(product.name)
              .font(.customfont(.bold, fontSize: Constants.screenWidth / 25))
              .lineLimit(1)
            Text(product.vendor.name)
              .font(.customfont(.bold, fontSize: Constants.screenWidth / 27))
              .lineLimit(1)
            if product.discountPrice != "0.00"  {
              Text("$ \(product.discountPrice)")
                .font(.customfont(.bold, fontSize: Constants.screenWidth / 23))
                .lineLimit(1)
            }
            if product.discountPrice == "0.00"  {
              Text("$ \(product.price)")
                .font(.customfont(.bold, fontSize: Constants.screenWidth / 23))
                .lineLimit(1)
            } else {
              Text("$ \(product.price)")
                .font(.customfont(.bold, fontSize: Constants.screenWidth / 23))
                .lineLimit(1)
                .foregroundColor(.darkGray)
                .overlay(
                  Rectangle()
                    .frame(height: 1.0)
                    .foregroundColor(.gray)
                    .offset(y: 0.5)
                )
            }
            if let tag = product.tags.first{
              Text(tag)
                .font(.customfont(.regular, fontSize: Constants.screenWidth / 22))
                .lineLimit(1)
                .padding(.horizontal,7)
                .padding(.vertical,2)
                .background{
                  RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.custom.primary.opacity(0.8))
                }
            }

          }
          Spacer()
        }
      }
      .clipShape(RoundedRectangle(cornerRadius: 8))
      .frame(width: Constants.screenWidth / 2.2, height: Constants.screenWidth / 3, alignment: .center)
    }
    .padding(.horizontal,5)
  }
}

#Preview {
  SearchViewProductCell(product: Product.products.first!)
}
