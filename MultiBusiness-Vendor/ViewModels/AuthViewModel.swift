//
//  LoginViewModel.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 9.04.2024.
//

import Foundation

class AuthViewModel: ObservableObject {

  @Published var txtUsername: String = ""
  @Published var txtEmail: String = ""
  @Published var txtPassword: String = ""
  @Published var txtPhoneNumber: String = ""
  @Published var isShowPassword: Bool = false

  @Published var showError = false
  @Published var errorMessage = ""
  @Published var isUserLogin: Bool = true

  @Published var countryCode: CountryCode = .init(image: "turkey_flag", countryCode: "90", countryName: "Turkey")
  @Published var isCountryCodeSelectionViewPresented = false
  static let shared = AuthViewModel()
  
}
