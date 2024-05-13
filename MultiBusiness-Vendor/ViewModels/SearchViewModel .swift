//
//  SearchViewModel .swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 31.03.2024.
//

import Foundation

class SearchViewModel: ObservableObject {
  
  @Published var vendors: Vendors?
  @Published var filtredVendors: [Vendor]?
  @Published var products: Products?
  @Published var filtredProducts: [Product]?
  
  @Published var selectedIndex = 0
  @Published var barPosition: BarPosition = .left
  @Published var barOffset: CGFloat = -76
  
  @Published var searchText = ""
  @Published var isSearching = false
  @Published var isSearched = false

  let serviceController = ServiceController.shared
  static let shared = SearchViewModel()
  let mainVM = MainViewModel.shared

  init() {
    mainVM.isProgressing = true
    Task {
      try await getVendors()
      mainVM.isProgressing = false
    }
  }
  
  @MainActor
  func getVendors() async throws {
    self.vendors = try await serviceController.getVendors()
    self.filtredVendors = self.vendors?.data
  }
  
  @MainActor
  func getProducts() async throws {
    self.products = try await serviceController.getProducts()
    filtredProducts = products?.data
  }

  // Bu fonksiyon, kullanıcının girdiği metni kullanarak tedarikçi verilerinde arama yapar
  func searchVendors(for searchText: String) {
      guard let allVendors = vendors?.data else {
          // Tedarikçi verileri yüklenmemişse arama yapma
          return
      }

    filtredVendors?.removeAll() // Her çağrıldığında filteredVendors'u temizle

      if searchText.isEmpty {
          // Eğer arama metni boş ise, tüm tedarikçileri göster
          self.filtredVendors = allVendors
      } else {
          // Arama metni ile tedarikçi isimlerini karşılaştırarak filtreleme yap
          self.filtredVendors = allVendors.filter { $0.name.lowercased().contains(searchText.lowercased()) }
      }
  }
}



enum BarPosition {
  case left
  case middle
  case right
}
