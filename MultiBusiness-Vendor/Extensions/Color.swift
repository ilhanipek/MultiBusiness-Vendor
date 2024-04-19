//
//  Color.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import Foundation
import SwiftUI

extension Color {
  class custom {
    static let primary = Color("Red")
    static let primaryApp = Color("PrimaryGroceryApp")
    static let darkGray = Color("DarkGray")
    static let primaryText = Color("PrimaryText")
    static let secondaryText = Color("SecondaryText")
    static let textTitle = Color("TextTitle")
    static let placeHolder = Color("Placeholder")
    static let background = Color("Background2")
    static let darkBlue = Color("DarkBlue")
  }
}

extension UIColor {
  convenience init?(hex: String) {
    guard hex.count >= 6 else { return nil } // Ensure at least 6 characters

    let hexSanitized = String(hex.dropFirst()) // Remove the first character

    let scanner = Scanner(string: hexSanitized)
    var color: UInt64 = 0
    guard scanner.scanHexInt64(&color) else { return nil } // Handle invalid format

    let red = CGFloat((color & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((color & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(color & 0x0000FF) / 255.0
    self.init(red: red, green: green, blue: blue, alpha: 1.0)
  }
}

