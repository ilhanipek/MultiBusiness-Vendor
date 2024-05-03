//
//  Service .swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 2.04.2024.
//

import Foundation
import UIKit

protocol EndpointProtocol {
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var headers: [String: String]? {get}
    var parameters: [String: Any]? {get}

    func request() -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum Endpoint {
  case categories
  case banners
  case products
  case services
  case bestProducts
  case forYouProducts
  case vendorTypes
  case vendors
  case vendorReviews
  case topVendors
  case bestVendors
  case appSettings
  case appOnboardings
  case search
  case tags
  case searchData
  case favourites
  case coupons
  case deliveryAddresses
  case paymentMethods
  case orders
  case trackOrder
  case packageOrders
  case packageOrderSummary
  case generalOrderSummary
  case chat
  case rating
  case walletBalance
  case walletTopUp
  case walletTransactions
  case myWalletAddress
  case walletAddressesSearch
  case walletTransfer
}

extension Endpoint: EndpointProtocol {
  var method: HTTPMethod {
    switch self {
    case .categories: return .get
    case .banners: return .get
    case .products: return .get
    case .services: return .get
    case .bestProducts: return .get
    case .forYouProducts: return .get
    case .vendorTypes: return .get
    case .vendors: return .get
    case .vendorReviews: return .get
    case .topVendors: return .get
    case .bestVendors: return .get
    case .appSettings:
      return .get
    case .appOnboardings:
      return .get
    case .search:
      return .get
    case .tags:
      return .get
    case .searchData:
      return .get
    case .favourites:
      return .get
    case .coupons:
      return .get
    case .deliveryAddresses:
      return .get
    case .paymentMethods:
      return .get
    case .orders:
      return .get
    case .trackOrder:
      return .get
    case .packageOrders:
      return .get
    case .packageOrderSummary:
      return .get
    case .generalOrderSummary:
      return .get
    case .chat:
      return .get
    case .rating:
      return .get
    case .walletBalance:
      return .get
    case .walletTopUp:
      return .get
    case .walletTransactions:
      return .get
    case .myWalletAddress:
      return .get
    case .walletAddressesSearch:
      return .get
    case .walletTransfer:
      return .get
    }
  }
  
  var headers: [String : String]? {
    return ["Content-type": "application/json; charset=UTF-8"]
  }
  
  var parameters: [String : Any]? {
    switch self {
    case .categories:
      return nil
    case .banners:
      return nil
    case .products:
      return nil
    case .services:
      return nil
    case .bestProducts:
      return nil
    case .forYouProducts:
      return nil
    case .vendorTypes:
      return nil
    case .vendors:
      return nil
    case .vendorReviews:
      return nil
    case .topVendors:
      return nil
    case .bestVendors:
      return nil
    case .appSettings:
      return nil
    case .appOnboardings:
      return nil
    case .search:
      return nil
    case .tags:
      return nil
    case .searchData:
      return nil
    case .favourites:
      return nil
    case .coupons:
      return nil
    case .deliveryAddresses:
      return nil
    case .paymentMethods:
      return nil
    case .orders:
      return nil
    case .trackOrder:
      return nil
    case .packageOrders:
      return nil
    case .packageOrderSummary:
      return nil
    case .generalOrderSummary:
      return nil
    case .chat:
      return nil
    case .rating:
      return nil
    case .walletBalance:
      return nil
    case .walletTopUp:
      return nil
    case .walletTransactions:
      return nil
    case .myWalletAddress:
      return nil
    case .walletAddressesSearch:
      return nil
    case .walletTransfer:
      return nil
    }
  }
  
  func request() -> URLRequest {
    guard let components = URLComponents(string: baseURL),
          let url = components.url?.appendingPathComponent(path) else {
      fatalError("URL HATASI")
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue

    if let parameters = parameters {
      do {
        let data = try JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = data
      }catch {
        print(error.localizedDescription)
      }
    }
    if let headers = headers {
      for (key, value) in headers {
        request.setValue(value, forHTTPHeaderField: key)
      }
    }
    return request
  }
  
  var baseURL: String {
    return "http://mecomkou.com/api"
  }

  var path: String {
    switch self {
    case .banners: return "/banners"
    case .categories: return "/categories"
    case .products: return "/products"
    case .services: return "/services"
    case .bestProducts: return "/products?type=best"
    case .forYouProducts: return "/products?type=you"
    case .vendorTypes: return "/vendor/types"
    case .vendors: return "/vendors"
    case .vendorReviews: return "/vendor/reviews"
    case .topVendors: return "/vendors?type=top" 
    case .bestVendors: return "/vendors?type=best"
    case .appSettings: return "/app/settings"
    case .appOnboardings: return "/app/onboarding?type=customer"
    case .search: return "/search"
    case .tags: return "/tags"
    case .searchData: return "/search/data"
    case .favourites: return ""
    case .coupons: return "/coupons"
    case .deliveryAddresses: return ""
    case .paymentMethods: return ""
    case .orders: return ""
    case .trackOrder: return ""
    case .packageOrders: return ""
    case .packageOrderSummary: return ""
    case .generalOrderSummary: return ""
    case .chat: return ""
    case .rating: return ""
    case .walletBalance: return ""
    case .walletTopUp: return ""
    case .walletTransactions: return ""
    case .myWalletAddress: return ""
    case .walletAddressesSearch: return ""
    case .walletTransfer: return ""
    }
  }
}
