//
//  MainViewModel.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import Foundation
import SwiftUI
import CoreLocation
import Combine
import FirebaseAuth


class MainViewModel: ObservableObject {

  // Authentication
  private let service = FireBaseAuthService.shared
  private var cancellables = Set<AnyCancellable>()
  @Published var userSession: FirebaseAuth.User?
  @Published var currentUser: User?

  // Bottom Tab Bar
  @Published var selectTab: Int = 0

  // Location
  @Published var locationText: String = ""
  @Published var cityText: String = ""
  @Published var neighborhoodText: String = ""
  @Published var streetText: String = ""
  @Published var currentLocationLatitude : CLLocationDegrees = 30
  @Published var currentLocationLongtitude : CLLocationDegrees = 30

  // Progress
  @Published var isProgressing = false

  // Singleton
  static let shared = MainViewModel()

  init() {
    fetchLocation()
    startUserSession()
  }

  func startUserSession() {
    service.$userSession.sink { [weak self] userSession in
      DispatchQueue.main.async {
        self?.userSession = userSession // nil to open loginview
      }

    }
    .store(in: &cancellables)
    service.$currentUser.sink { [weak self] currentUser in
      DispatchQueue.main.async {
        self?.currentUser = currentUser // nil to open loginview
      }
    }
    .store(in: &cancellables)
  }

  func fetchLocation() {
      let locationManager = CLLocationManager()

      if locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways {
          if let currentLocation = locationManager.location {
            locationText = "\(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)"
            currentLocationLatitude = currentLocation.coordinate.latitude
            currentLocationLongtitude = currentLocation.coordinate.longitude

              let geocoder = CLGeocoder()
              geocoder.reverseGeocodeLocation(currentLocation) { placemarks, error in
                  if let error = error {
                      print("Error fetching address: \(error.localizedDescription)")
                      return
                  }

                  if let firstPlacemark = placemarks?.first {
                      self.cityText = firstPlacemark.locality ?? ""
                      self.neighborhoodText = firstPlacemark.subLocality ?? ""
                      self.streetText = firstPlacemark.thoroughfare ?? ""
                  }
              }
          } else {
              locationText = "Konum bilgisi alınamadı."
          }
      } else {
          locationManager.requestWhenInUseAuthorization()
      }
  }
}

