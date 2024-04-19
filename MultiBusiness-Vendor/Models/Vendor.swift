


import Foundation

struct Vendors: Codable {
  let data: [Vendor]
}

struct Vendor: Codable {
  let id: Int
      let name, description: String
      let baseDeliveryFee, deliveryFee, deliveryRange: Int
      let tax, phone, email, address: String
      let latitude, longitude: String
      let commission, pickup, delivery, isActive: Int
      let chargePerKM: Int
      let isOpen: Bool
      let vendorTypeID: Int
      let autoAssignment, autoAccept: String
      let allowScheduleOrder, hasSubCategories: Bool
      let minOrder, maxOrder: String
      let useSubscription: Bool
      let hasDrivers: String
      let prepareTime, deliveryTime: String?
      let inOrder, featured, createdAt, updatedAt: String
      let deletedAt: String?
      let creatorID: String?
      let reviewsCount: Int
      let formattedDate: String
      let logo: String
      let featureImage: String
      let rating: Int
      let canRate: Bool
      let slots: [String]
      let isPackageVendor: Int
      let hasSubscription, documentRequested, pendingDocumentApproval: Bool
      let vendorType: VendorType
      let fees: [Fee]
      let days: [String]

    enum CodingKeys: String, CodingKey {
      case id, name, description
              case baseDeliveryFee = "base_delivery_fee"
              case deliveryFee = "delivery_fee"
              case deliveryRange = "delivery_range"
              case tax, phone, email, address, latitude, longitude, commission, pickup, delivery
              case isActive = "is_active"
              case chargePerKM = "charge_per_km"
              case isOpen = "is_open"
              case vendorTypeID = "vendor_type_id"
              case autoAssignment = "auto_assignment"
              case autoAccept = "auto_accept"
              case allowScheduleOrder = "allow_schedule_order"
              case hasSubCategories = "has_sub_categories"
              case minOrder = "min_order"
              case maxOrder = "max_order"
              case useSubscription = "use_subscription"
              case hasDrivers = "has_drivers"
              case prepareTime = "prepare_time"
              case deliveryTime = "delivery_time"
              case inOrder = "in_order"
              case featured
              case createdAt = "created_at"
              case updatedAt = "updated_at"
              case deletedAt = "deleted_at"
              case creatorID = "creator_id"
              case reviewsCount = "reviews_count"
              case formattedDate = "formatted_date"
              case logo
              case featureImage = "feature_image"
              case rating
              case canRate = "can_rate"
              case slots
              case isPackageVendor = "is_package_vendor"
              case hasSubscription = "has_subscription"
              case documentRequested = "document_requested"
              case pendingDocumentApproval = "pending_document_approval"
              case vendorType = "vendor_type"
              case fees, days
    }
}

extension Vendor {
    static let vendors: [Vendor] = [
      .init(id: 1, name: "", description: "", baseDeliveryFee: 1, deliveryFee: 1, deliveryRange: 1, tax: "", phone: "", email: "", address: "", latitude: "", longitude: "", commission: 1, pickup: 1, delivery: 1, isActive: 1, chargePerKM: 1, isOpen: true, vendorTypeID: 1, autoAssignment: "", autoAccept: "", allowScheduleOrder: true, hasSubCategories: true, minOrder: "", maxOrder: "", useSubscription: true, hasDrivers: "", prepareTime: "40", deliveryTime: "10-30", inOrder: "", featured: "1", createdAt: "", updatedAt: "", deletedAt: "", creatorID: "", reviewsCount: 4, formattedDate: "", logo: "\(Constants.bananaUrl)", featureImage: "\(Constants.bananaUrl)", rating: 2, canRate: true, slots: [""], isPackageVendor: 1, hasSubscription: true, documentRequested: true, pendingDocumentApproval: true, vendorType: VendorType.vendorTypes.first!, fees: Fee.fees, days: [""])
    ]
}
