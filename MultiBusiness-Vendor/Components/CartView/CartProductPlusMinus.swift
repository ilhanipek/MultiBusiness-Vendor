//
//  ProductPlusMinus.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 2.05.2024.
//

import SwiftUI

struct CartProductPlusMinus: View {
  @Binding var count: Int
    var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
        .stroke(lineWidth: 2)
        HStack {
          Button {
            if count > 0 {
              count = count - 1
            }

          } label: {
            Image(systemName: "minus")
              .resizable()
              .foregroundStyle(Color.black)

              .frame(width: 20, height: 4, alignment: .center)
              .padding(.leading,10)
          }
          Spacer()
          Text("\(count)")
            .font(.customfont(.semibold, fontSize: Constants.screenWidth / 15))
          Spacer()
          Button {
            count = count + 1
          } label: {
            Image(systemName: "plus")
              .resizable()
              .foregroundStyle(Color.black)
              .frame(width: 20, height: 20, alignment: .center)
              .padding(.trailing,10)
          }
        }
      }
      .frame(width: Constants.screenWidth / 4, height: Constants.screenWidth / 10, alignment: .center)

    }
}

#Preview {
  CartProductPlusMinus(count: .constant(0))
}
