//
//  CategoryDetailViewModel .swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 5.05.2024.
//

import SwiftUI

class CategoryDetailViewModel: ObservableObject {
  
  @Published var vendors: Vendors?
  @Published var products: Products?

  let sC = ServiceController.shared
  init() {

    Task {
      
    }
  }

  @MainActor
  func getVendors() async throws {
    var vendors : Vendors
    vendors = try await sC.getVendors()
    vendors.data.forEach { vendor in
      
    }
  }

}
