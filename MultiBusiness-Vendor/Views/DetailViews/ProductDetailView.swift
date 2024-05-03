//
//  ProductDetailView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 2.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
  var product : Product
  @State var count = 0
    var body: some View {
      ZStack {
        Color.custom.background
          .ignoresSafeArea()
        VStack {
          ProductDetailTopFiller(product: product)
          WebImage(url: URL(string: "\(product.photo)"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Constants.screenWidth, height: Constants.screenHeight / 3, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 10))
          
          ZStack {
            RoundedRectangle(cornerRadius: 10)
              .foregroundStyle(Color.white)
              .ignoresSafeArea()
            ScrollView {
              VStack {
                HStack {
                  Text("Price:")
                    .foregroundStyle(Color.custom.primaryText.opacity(0.6))
                    .font(.customfont(.regular, fontSize: Constants.screenWidth / 20))
                  if product.discountPrice != "0.00"  {
                    Text("$ \(product.discountPrice)")
                      .font(.customfont(.bold, fontSize: Constants.screenWidth / 15))
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
                  Spacer()
                  Button {
                    // Making Fav
                  } label: {
                    Image(systemName: "heart")
                      .resizable()
                      .foregroundStyle(Color.red)
                      .frame(width: Constants.screenWidth / 13, height: Constants.screenWidth / 14, alignment: .center)
                  }
                }
                .padding()

                HStack {
                  Text("Quantity")
                    .font(.customfont(.regular, fontSize: Constants.screenWidth / 15))
                    .padding(.leading)
                  Spacer()
                  ProductPlusMinus(count: $count)
                    .padding(.trailing)
                }

                RoundButton(title: "Add to cart") {
                  // Add cart
                }
                .padding(.horizontal,7)
                .padding(.top)
                RoundButton(title: "Buy Now", didTap: {
                  // Navigation to cart
                })
                .padding(.horizontal,7)
              }
              Divider()
                .padding(.vertical,7)

                HStack {
                  VStack(alignment: .leading) {
                    Text("Description")
                      .font(.customfont(.bold, fontSize: Constants.screenWidth / 10))
                      .bold()
                      .padding(.leading)
                    Text("\(product.description)")
                      .font(.customfont(.bold, fontSize: Constants.screenWidth / 20))
                      .padding(.leading)
                      .padding(.top,5)
                  }
                  Spacer()
                }
            }
          }
          .padding(.top,5)
          .frame(width: Constants.screenWidth, height: Constants.screenHeight / 1.9, alignment: .center)
          Spacer()
        }
      }
      .navigationBarBackButtonHidden()
    }
}

#Preview {
  ProductDetailView(product: Product.products.first!)
}
