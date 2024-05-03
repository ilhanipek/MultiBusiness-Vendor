//
//  ProductDetailTopFiller.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 2.05.2024.
//

import SwiftUI

struct ProductDetailTopFiller: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  var product: Product
    var body: some View {
      ZStack{
        RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(Color.custom.primary)
        .ignoresSafeArea()
        HStack {
          Button {
            mode.wrappedValue.dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .foregroundStyle(Color.custom.background)
              .padding(.leading)
          }
          Spacer()
          Text("\(product.name)")
              .foregroundStyle(Color.custom.background)
              .font(.customfont(.semibold, fontSize: Constants.screenHeight / 30))
              .padding(.trailing)
          Spacer()
        }

      }
        .frame(width: Constants.screenWidth, height: Constants.screenHeight / 25, alignment: .center)
    }
}

#Preview {
  ProductDetailTopFiller(product: Product.products.first!)
}
