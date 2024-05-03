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
  let price, discountPrice: String
  let capacity: String?
  let unit: String
  let packageCount, availableQty: String?
  let featured, deliverable, isActive, plusOption: String
  let digital: String
  let ageRestricted: Bool
  let vendorID, inOrder, approved, createdAt: String
  let updatedAt: String
  let deletedAt: String?
  let reviewsCount, formattedDate, sellPrice: String
  let photo: String
  let isFavourite: Bool
  let rating: Int
  let optionGroups: [String]
  let photos: [String]
  let digitalFiles: [String]
  let token: String
  let vendor: Vendor
  let tags: [String]

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
      case approved
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
    .init(id: 1, name: "Banana", sku: "", barcode: "", description: "This is banana. Banana is good. Monkey likes banana. Monkey loves banana. Banana is monkeys precious. ", price: "100", discountPrice: "90", capacity: "", unit: "", packageCount: "", availableQty: "", featured: "", deliverable: "", isActive: "", plusOption: "", digital: "", ageRestricted: true, vendorID: "", inOrder: "", approved: "", createdAt: "", updatedAt: "", deletedAt: "", reviewsCount: "", formattedDate: "", sellPrice: "", photo: "\(Constants.bananaUrl)", isFavourite: true, rating: 1, optionGroups: ["",""], photos: ["",""], digitalFiles: ["",""], token: "", vendor: Vendor.vendors.first!, tags: ["",""])
  ]
}
