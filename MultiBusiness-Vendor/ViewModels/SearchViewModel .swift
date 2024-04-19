//
//  SearchViewModel .swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 31.03.2024.
//

import Foundation

class SearchViewModel : ObservableObject {
  
  @Published var vendors: Vendors?
  @Published var products: Products?

  @Published var barPosition : BarPosition = .left

  let sC = ServiceController.shared
  static let shared = SearchViewModel()
  let mainVM = MainViewModel.shared

  init() {
    mainVM.isProgressing = true
    Task{
      try await getSearchVendors()
      mainVM.isProgressing = false
    }
  }


  func getSearchVendors() async throws {
    self.vendors = try await sC.getSearchVendors()
  }

  func getProducts() async throws{
    self.products = try await sC.getProducts()
  }

  func getServices(){

  }
}

enum BarPosition {
  case left
  case middle
  case right
}