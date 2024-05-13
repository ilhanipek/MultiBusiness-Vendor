//
//  Category.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 29.03.2024.
//

import Foundation

struct Categories: Codable {
  let data: [Category]
}

struct Category: Codable,Identifiable,Hashable {
  let id: Int
  let categoryID: String?
  let vendorType: VendorType
  let name: String
  let photo: String
  let color: String
  let hasSubcategories: Bool
  
  enum CodingKeys: String, CodingKey {
    case id
    case categoryID = "category_id"
    case vendorType = "vendor_type"
    case name, photo, color
    case hasSubcategories = "has_subcategories"
  }
}

extension Category {
  static let categories: [Category] = [
    .init(id: 1, categoryID: nil, vendorType: VendorType.vendorTypes.first!, name: "Category1", photo: "\(Constants.bananaUrl)", color: "", hasSubcategories: false)
  ]
}
