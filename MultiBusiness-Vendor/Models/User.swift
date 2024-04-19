//
//  User.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 29.03.2024.
//

import Foundation

struct User: Identifiable, Hashable, Codable {

  var id: String
  var name: String
  var code: String?
  var email: String
  var phone: String
  var rawPhone: String?
  var countryCode: String?
  var photo: String?
  var role: String?
  var walletAddress: String?
}
