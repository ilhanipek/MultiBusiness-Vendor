//
//  Category.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 29.03.2024.
//

import Foundation

struct Category: Codable {
    let id: Int
    let categoryId: Int?
    let vendorType: VendorType
    let name: String
    let photo: String
    let color: String
    let hasSubcategories: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case categoryId = "category_id"
        case vendorType = "vendor_type"
        case name
        case photo
        case color
        case hasSubcategories = "has_subcategories"
    }
}

extension Category {
  static let categories: [Category] = [
    .init(id: 1, categoryId: nil, vendorType: VendorType.vendorTypes.first!, name: "Category1", photo: "\(Constants.bananaUrl)", color: "", hasSubcategories: false)
  ]
}
