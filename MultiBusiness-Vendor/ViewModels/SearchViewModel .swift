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
  
  @Published var selectedIndex = 0
  @Published var barPosition : BarPosition = .left
  @Published var barOffset: CGFloat = -76

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

  @MainActor
  func getSearchVendors() async throws {
    self.vendors = try await sC.getSearchVendors()
  }
  
  @MainActor
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
