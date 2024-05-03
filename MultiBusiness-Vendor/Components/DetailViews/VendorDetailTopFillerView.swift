//
//  VendorDetailTopFiller .swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 3.05.2024.
//

import SwiftUI

struct VendorDetailTopFillerView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @State var text: String
  @State var isSearching: Bool
  var vendor: Vendor
  var didCommit: (()->())?
    var body: some View {
      ZStack{
        RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(Color.custom.primary)
        .ignoresSafeArea()
        VStack {
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
          .padding(.top)
          SearchBar(placeholder: "Search in banana store", text: $text, isSearching: $isSearching) {
            didCommit?()
          }
          .padding(.bottom)
        }

      }
        .frame(width: Constants.screenWidth, height: Constants.screenHeight / 12, alignment: .center)
    }
}

#Preview {
  VendorDetailTopFillerView(text: "", isSearching: false, vendor: Vendor.vendors.first!)
}
