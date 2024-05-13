//
//  HomeViewModel.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 10.04.2024.
//

import Foundation

class HomeViewModel: ObservableObject {

  @Published var vendorTypes : [VendorType] = []
  @Published var coupons: [Coupon] = []
  @Published var bestVendors: [Vendor] = []
  @Published var banners: Banners?

  let sC = ServiceController.shared
  let mainVM = MainViewModel.shared

  static let shared = HomeViewModel()
  init() {
    mainVM.isProgressing = true
    Task{
      try await getBanners()
      try await getVendorTypes()
      try await getCoupons()
      //try await getBestVendors()
      mainVM.isProgressing = false
    }
  }
  
  @MainActor
  func getVendorTypes() async throws {
    self.vendorTypes = try await sC.getVendorTypes()
  }
  
  @MainActor
  func getCoupons() async throws {
    self.coupons = try await sC.getCoupons()
  }

  @MainActor
  func getBestVendors() async throws {
    self.bestVendors = try await sC.getBestVendors()
    //print(self.bestVendors)
  }

  @MainActor
  func getBanners() async throws {
    self.banners = try await sC.getBanners()
    print(self.banners!)
  }
  
}
