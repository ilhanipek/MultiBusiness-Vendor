//
//  VendorDetailView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 2.05.2024.
//

import SwiftUI

struct VendorDetailView: View {
  var vendor : Vendor
    var body: some View {
      ZStack {
        Color.custom.background
          .ignoresSafeArea()
        VStack {
            VendorDetailTopFillerView(text: "", isSearching: false, vendor: vendor) {
              // On commit 
            }
            Spacer()
        }
      }
    }
}

#Preview {
  VendorDetailView(vendor: Vendor.vendors.first!)
}
