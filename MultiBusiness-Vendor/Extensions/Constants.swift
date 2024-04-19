//
//  Constants.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import Foundation
import SwiftUI


import Foundation

class Api {

    static var baseUrl: String {
        return "http://multivendor.mecomkou.com/api"
        // return "http://192.168.100.3:8000/api
    }

    static let appSettings = "/app/settings"
    static let appOnboardings = "/app/onboarding?type=customer"
    static let faqs = "/app/faqs?type=customer"

    static let accountDelete = "/account/delete"
    static let tokenSync = "/device/token/sync"
    static let login = "/login"
    static let qrlogin = "/login/qrcode"
    static let register = "/register"
    static let logout = "/logout"
    static let forgotPassword = "/password/reset/init"
    static let verifyPhoneAccount = "/verify/phone"
    static let updateProfile = "/profile/update"
    static let updatePassword = "/profile/password/update"

    static let sendOtp = "/otp/send"
    static let verifyOtp = "/otp/verify"
    static let verifyFirebaseOtp = "/otp/firebase/verify"
    static let socialLogin = "/social/login"

    static let banners = "/banners"
    static let categories = "/categories"
    static let products = "/products"
    static let services = "/services"
    static let bestProducts = "/products?type=best"
    static let forYouProducts = "/products?type=you"
    static let vendorTypes = "/vendor/types"
    static let vendors = "/vendors"
    static let vendorReviews = "/vendor/reviews"
    static let topVendors = "/vendors?type=top"
    static let bestVendors = "/vendors?type=best"

    static let search = "/search"
    static let tags = "/tags"
    static let searchData = "/search/data"
    static let favourites = "/favourites"

    //cart & checkout
    static let coupons = "/coupons"
    static let deliveryAddresses = "/delivery/addresses"
    static let paymentMethods = "/payment/methods"
    static let orders = "/orders"
    static let trackOrder = "/track/order"
    static let packageOrders = "/package/orders"
    static let packageOrderSummary = "/package/order/summary"
    static let generalOrderSummary = "/general/order/summary"
    static let chat = "/chat/notification"
    static let rating = "/rating"

    //packages
    static let packageTypes = "/package/types"
    static let packageVendors = "/package/order/vendors"

    //Taxi booking
    static let vehicleTypes = "/vehicle/types"
    static let vehicleTypePricing = "/vehicle/types/pricing"
    static let newTaxiBooking = "/taxi/book/order"
    static let currentTaxiBooking = "/taxi/current/order"
    static let cancelTaxiBooking = "/taxi/order/cancel"
    static let taxiDriverInfo = "/taxi/driver/info"
    static let taxiLocationAvailable = "/taxi/location/available"
    static let taxiTripLocationHistory = "/taxi/location/history"

    //wallet
    static let walletBalance = "/wallet/balance"
    static let walletTopUp = "/wallet/topup"
    static let walletTransactions = "/wallet/transactions"
    static let myWalletAddress = "/wallet/my/address"
    static let walletAddressesSearch = "/wallet/address/search"
    static let walletTransfer = "/wallet/address/transfer"

    //loyaltypoints
    static let myLoyaltyPoints = "/loyalty/point/my"
    static let loyaltyPointsWithdraw = "/loyalty/point/my/withdraw"
    static let loyaltyPointsReport = "/loyalty/point/my/report"

    //map
    static let geocoderForward = "/geocoder/forward"
    static let geocoderReserve = "/geocoder/2/reserve"
    static let geocoderPlaceDetails = "/geocoder/place/details"

    //reviews
    static let productReviewSummary = "/product/review/summary"
    static let productReviews = "/product/reviews"
    static let productBoughtFrequent = "/product/frequent"

    //flash sales
    static let flashSales = "/flash/sales"
    static let externalRedirect = "/external/redirect"

    //
    static let cancellationReasons = "/cancellation/reasons"

    // Other pages
    static var privacyPolicy: String {
        let webUrl = baseUrl.replacingOccurrences(of: "/api", with: "")
        return "\(webUrl)/privacy/policy"
    }

    static var terms: String {
        let webUrl = baseUrl.replacingOccurrences(of: "/api", with: "")
        return "\(webUrl)/pages/terms"
    }

    static var contactUs: String {
        let webUrl = baseUrl.replacingOccurrences(of: "/api", with: "")
        return "\(webUrl)/pages/contact"
    }

    static var inappSupport: String {
        let webUrl = baseUrl.replacingOccurrences(of: "/api", with: "")
        return "\(webUrl)/support/chat"
    }

    static var appShareLink: String {
        let webUrl = baseUrl.replacingOccurrences(of: "/api", with: "")
        return "\(webUrl)/preview/share"
    }
}

struct Constants {

  static let screenWidth: CGFloat = UIScreen.main.bounds.width
  static let screenHeight: CGFloat = UIScreen.main.bounds.height
  
  static let baseUrl = "http://multivendor.mecomkou.com/api"
  static let bananaUrl = "https://ardenmarket.com.tr/media/catalog/product/cache/0b154ba1d9ffbc98998b9163ce10b49b/m/u/muz_yerli_kg_1.png"
  
}
