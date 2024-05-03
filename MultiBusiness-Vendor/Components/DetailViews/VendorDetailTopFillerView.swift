//
//  VendorDetailTopFiller .swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 3.05.2024.
//

import SwiftUI

struct VendorDetailTopFillerView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  var vendor: Vendor
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
          Text("\(vendor.name)")
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
    VendorDetailTopFillerView()
}
