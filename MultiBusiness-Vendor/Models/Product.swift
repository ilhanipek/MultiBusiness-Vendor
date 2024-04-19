//
//  Struct.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 29.03.2024.
//

import Foundation

struct Products: Codable {
  let data: [Product]
}

struct Product: Codable {
  
  let id: Int
  let name, sku, barcode, description: String
  let price: String
  let discountPrice, capacity, unit: String
  let packageCount, availableQty, featured, deliverable: String
  let isActive, plusOption, digital: String
  let ageRestricted: Bool
  let vendorID, inOrder, createdAt, updatedAt: String
  let deletedAt: String?
  let reviewsCount, formattedDate, sellPrice: String
  let photo: String
  let isFavourite: Bool
  let rating: Int
  let optionGroups: [String]
  let photos: [String]
  let digitalFiles: [String]?
  let token: String
  let vendor: Vendor
  let tags: [Tag]

  enum CodingKeys: String, CodingKey {
      case id, name, sku, barcode, description, price
      case discountPrice = "discount_price"
      case capacity, unit
      case packageCount = "package_count"
      case availableQty = "available_qty"
      case featured, deliverable
      case isActive = "is_active"
      case plusOption = "plus_option"
      case digital
      case ageRestricted = "age_restricted"
      case vendorID = "vendor_id"
      case inOrder = "in_order"
      case createdAt = "created_at"
      case updatedAt = "updated_at"
      case deletedAt = "deleted_at"
      case reviewsCount = "reviews_count"
      case formattedDate = "formatted_date"
      case sellPrice = "sell_price"
      case photo
      case isFavourite = "is_favourite"
      case rating
      case optionGroups = "option_groups"
      case photos
      case digitalFiles = "digital_files"
      case token, vendor, tags
  }
}

extension Product {
  static let products: [Product] = [
    .init(id: 1, name: "Product1", sku: "0", barcode: "101010100101010", description: "I'm good", price: "500", discountPrice: "450", capacity: "15", unit: "kg", packageCount: "", availableQty: "500", featured: "1", deliverable: "1", isActive: "1", plusOption: "0", digital: "0", ageRestricted: false, vendorID: "", inOrder: "", createdAt: "", updatedAt: "", deletedAt: "", reviewsCount: "80", formattedDate: "", sellPrice: "", photo: "\(Constants.bananaUrl)", isFavourite: true, rating: 33, optionGroups: ["",""], photos: ["\(Constants.bananaUrl)","\(Constants.bananaUrl)"], digitalFiles: nil, token: "", vendor: Vendor.vendors.first!, tags: Tag.tags)
  ]
}
