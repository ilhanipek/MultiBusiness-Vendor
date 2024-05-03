//
//  CategoryCell.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 23.04.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
  @State var imageUrl: String
    var body: some View {
      ZStack{
        RoundedRectangle(cornerRadius: 8)
          .stroke(lineWidth: 0.3)
          .foregroundStyle(Color.custom.primary)
          .frame(width: Constants.screenWidth / 4, height: Constants.screenWidth / 4, alignment: .center)
        WebImage(url: URL(string: imageUrl))
          .resizable()
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .frame(width: Constants.screenWidth / 4, height: Constants.screenWidth / 4, alignment: .center)
      }
    }
}

#Preview {
  CategoryCell(imageUrl: "\(Constants.bananaUrl)")
}
