//
//  CartProductCell.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 13.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartProductCell: View {
  var productWithQuantity : ProductWithQuantity
  var onDelete: (() -> ())?
  @State var count = 0
    var body: some View {
        ZStack {
          RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 0.1)

            .foregroundStyle(Color.black)
            .frame(width: Constants.screenWidth - 20, height: Constants.screenWidth / 7, alignment: .center)

          ZStack {
            Color.white
            HStack {
              ZStack {
                RoundedRectangle(cornerRadius: 8)
                  .stroke(lineWidth: 0.15)
                  .foregroundStyle(Color.black)
                WebImage(url: URL(string: productWithQuantity.product.photo))
                  .resizable()
                  .clipShape(RoundedRectangle(cornerRadius: 8))
              }
              .frame(width: Constants.screenWidth / 3.5, height: Constants.screenWidth / 3.5, alignment: .center)
              .padding(.leading)

              VStack(alignment: .leading) {
                Text(productWithQuantity.product.name)
                  .font(.customfont(.bold, fontSize: Constants.screenWidth / 15))
                  .padding()
                Spacer()
                HStack {
                  if productWithQuantity.product.discountPrice != "0.00" {
                    Text("$\(productWithQuantity.product.discountPrice)")
                      .font(.title3)
                      .bold()
                      .padding(.bottom,30)
                      .padding(.leading)
                  } else {
                    Text("$\(productWithQuantity.product.price)")
                      .font(.title3)
                      .bold()
                      .padding(.bottom,30)
                      .padding(.leading)
                  }
                  Spacer()
                  CartProductPlusMinus(count: $count)
                    .padding(.bottom,30)
                    .padding(.trailing)
                }
              }
              Spacer()
            }
          }
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .frame(width: Constants.screenWidth - 20, height: Constants.screenWidth / 2.7, alignment: .center)
          Button {
            onDelete?()
          } label: {
            ZStack {
              RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color.red)
                .frame(width: Constants.screenWidth / 10, height: Constants.screenWidth / 10, alignment: .center)
              Image(systemName: "xmark")
                .foregroundStyle(Color.white)

            }
          }
          .offset(x: -(Constants.screenWidth - 45) / 2, y: -(Constants.screenWidth / 2.2 - 50) / 2)
        }
      }
    
}

#Preview {
  CartProductCell(productWithQuantity: .init(product: Product.products.first!, quantity: 1))
}
