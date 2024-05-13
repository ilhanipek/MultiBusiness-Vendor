//
//  AuthViewModel.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 2.04.2024.
//

import Foundation

protocol ServiceControllerProtocol {

  func getVendorTypes() async throws -> [VendorType]
}

final class ServiceController: ObservableObject {

  static let shared = ServiceController()
  private let networkManager = NetworkManager.shared
  private let dataNetworkManager = DataNetworkManager.shared

  private init() {}

  func getVendorTypes() async throws -> [VendorType] {
    let endpoint = Endpoint.vendorTypes
    var vendorTypes : [VendorType] = []
    vendorTypes = try await networkManager.request(endpoint)
    return vendorTypes
  }

  func getCoupons() async throws -> [Coupon] {
    let endpoint = Endpoint.coupons
    var coupons : [Coupon] = []
    coupons = try await networkManager.request(endpoint)
    return coupons
  }

  func getBestVendors() async throws -> [Vendor] {
    let endPoint = Endpoint.bestVendors
    var bestVendors: [Vendor] = []
    bestVendors = try await networkManager.request(endPoint)
    return bestVendors
  }

  func getBanners() async throws -> Banners {
    var banners: Banners
    let endPoint = Endpoint.banners

    banners = try await dataNetworkManager.request(endPoint)
    return banners
  }

  func getProducts() async throws -> Products {
    var products: Products
    let endPoint = Endpoint.products

    products = try await dataNetworkManager.request(endPoint)
    return products
  }

  func getCategories() async throws -> Categories {
    var categories : Categories 
    let endPoint = Endpoint.categories
    
    categories = try await dataNetworkManager.request(endPoint)
    return categories
  }

  func getVendors() async throws -> Vendors {
    let vendors : Vendors
    let endPoint = Endpoint.vendors
    
    vendors = try await dataNetworkManager.request(endPoint)
    return vendors
  }
}
