//
//  Banner.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 29.03.2024.
//

import Foundation

struct Banners: Codable {
  let data: [Banner]
}
struct Banner: Codable,Identifiable {
    let id: Int
    let category: Category?
    let photo: String
    let vendor: Vendor
    let link: String

    enum CodingKeys: String, CodingKey {
        case id
        case category
        case photo
        case vendor
        case link
    }
}

extension Banner {
  static let banners: [Banner] = [
    .init(id: 1, category: nil, photo: "\(Constants.bananaUrl)", vendor: Vendor.vendors.first!, link: "http://customer.mecomkou.com/8/commerce")
  ]
}
