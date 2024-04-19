//
//  Tag.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 13.04.2024.
//

import Foundation

struct Tag: Codable {
    let id: Int
    let name, vendorTypeID, inOrder, createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case vendorTypeID = "vendor_type_id"
        case inOrder = "in_order"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

extension Tag {
  static let tags : [Tag] = [
    .init(id: 1, name: "Tag1", vendorTypeID: "", inOrder: "1", createdAt: "", updatedAt: "")
  ]
}
