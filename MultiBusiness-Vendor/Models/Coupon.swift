//
//  Coupon.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 7.04.2024.
//

import Foundation

struct Coupon: Codable {
    let id: Int
    let code, color, description, discount: String
    let minOrderAmount, maxCouponAmount, percentage, expiresOn: String
    let times, isActive: String
    let forDelivery: Bool
    let creatorID, vendorTypeID, createdAt, updatedAt: String
    let deletedAt: String?
    let formattedExpiresOn: String
    let useLeft: Int
    let expired: Bool
    let photo: String

    private enum CodingKeys: String, CodingKey {
        case id, code, color, description, discount
        case minOrderAmount = "min_order_amount"
        case maxCouponAmount = "max_coupon_amount"
        case percentage
        case expiresOn = "expires_on"
        case times
        case isActive = "is_active"
        case forDelivery = "for_delivery"
        case creatorID = "creator_id"
        case vendorTypeID = "vendor_type_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case formattedExpiresOn = "formatted_expires_on"
        case useLeft = "use_left"
        case expired, photo
    }
}

