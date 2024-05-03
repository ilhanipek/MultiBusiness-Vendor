//
//  PlatformCellViewModel.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 22.04.2024.
//

import Foundation

class PlatformCellViewModel: ObservableObject {

  @Published var vendorType: VendorType

  init(vendorType: VendorType) {
    self.vendorType = vendorType
  }
}
