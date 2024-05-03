//
//  VendorType.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 29.03.2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - VendorType
struct VendorType: Codable,Identifiable, Hashable {
  let id: Int
  let name, color, description, slug: String
  let isActive: Int
  let inOrder, createdAt, updatedAt: String
  let deletedAt: String?
  let formattedDate: String
  let logo: String
  let websiteHeader: String
  let hasBanners: Int

  enum CodingKeys: String, CodingKey {
      case id, name, color, description, slug
      case isActive = "is_active"
      case inOrder = "in_order"
      case createdAt = "created_at"
      case updatedAt = "updated_at"
      case deletedAt = "deleted_at"
      case formattedDate = "formatted_date"
      case logo
      case websiteHeader = "website_header"
      case hasBanners = "has_banners"
  }
}

extension VendorType {
  static let vendorTypes: [VendorType] = [
    .init(id: 1, name: "VendorType", color: "", description: "", slug: "", isActive: 1, inOrder: "", createdAt: "", updatedAt: "", deletedAt: nil, formattedDate: "", logo: "", websiteHeader: "", hasBanners: 1)
  ]
}

