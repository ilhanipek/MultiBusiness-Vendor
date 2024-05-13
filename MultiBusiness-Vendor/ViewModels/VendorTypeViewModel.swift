//
//  VendorTypeViewModel.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 22.04.2024.
//

import Foundation

class VendorTypeViewModel: ObservableObject {
  @Published var searchText = ""
  @Published var vendorType : VendorType?
  @Published var isSearching = false

  @Published var categories: [Category]?
  @Published var products: [Product]?
  @Published var vendors: [Vendor]?

  let sC = ServiceController.shared
  let mainVM = MainViewModel.shared

  static let shared = VendorTypeViewModel()
  
  @MainActor
  func getCategories() async throws{
    self.categories?.removeAll()
    let categories = try await sC.getCategories()
    self.categories = categories.data.filter {$0.vendorType.name == vendorType?.name}
  }

  func getProductsByVendorType() async throws{
    let products = try await sC.getProducts()

    self.products = products.data
  }
  
  @MainActor
  func getVendors() async throws {
    self.vendors?.removeAll()
    let vendors = try await sC.getVendors()
    self.vendors = vendors.data.filter({$0.vendorType == vendorType})
    print(self.vendors)
  }
}
