// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct BestVendor: Codable {
    let currentPage: Int
    let data: [Vendor]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let links: [Link]
    let nextPageURL: String?
    let path: String
    let perPage: Int
    let prevPageURL: String?
    let to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case links
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}


// MARK: - Pivot
struct Pivot: Codable {
    let vendorID, feeID: Int

    enum CodingKeys: String, CodingKey {
        case vendorID = "vendor_id"
        case feeID = "fee_id"
    }
}


// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String
    let active: Bool
}


