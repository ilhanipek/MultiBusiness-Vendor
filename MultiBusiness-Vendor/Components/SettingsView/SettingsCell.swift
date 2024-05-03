//
//  SettingsCell.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 23.04.2024.
//

import SwiftUI

struct SettingsCell: View {
  var image: String
  var text: String
  var didTap: (()->())?
    var body: some View {
      Button {
        didTap?()
      } label: {
        ZStack{
          RoundedRectangle(cornerRadius: 5)
            .stroke(lineWidth: 0.7)
          .frame(width: Constants.screenWidth - 40, height: Constants.screenWidth / 8, alignment: .center)

          HStack{
            Image("\(image)")
            Text("\(text)")
            Spacer()
            Image(systemName: "chevron.right")
              .renderingMode(.template)
              .foregroundStyle(Color.custom.primary)
          }
          .padding(.horizontal,Constants.screenWidth / 15)
        }
        .foregroundStyle(Color.black)
      }
    }
}

#Preview {
  SettingsCell(image: "", text: "sdflksdlfj", didTap: {
    print("didtap")
  })
}
