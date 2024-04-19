//
//  Fee.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 11.04.2024.
//

import Foundation

struct Fee: Codable {
    let id: Int
    let name: String
    let value: String
    let percentage: Int
    let isActive: Int
    let forAdmin: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let formattedDateTime: String
    let formattedDate: String
    let formattedUpdatedDate: String
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case value
        case percentage
        case isActive = "is_active"
        case forAdmin = "for_admin"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case formattedDateTime = "formatted_date_time"
        case formattedDate = "formatted_date"
        case formattedUpdatedDate = "formatted_updated_date"
        case photo
    }
}

extension Fee {
  static let fees: [Fee] = [
    .init(id: 1, name: "", value: "", percentage: 10, isActive: 1, forAdmin: 1, createdAt: "", updatedAt: "", deletedAt: "", formattedDateTime: "", formattedDate: "", formattedUpdatedDate: "", photo: "")
  ]
}
