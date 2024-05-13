//
//  MultiBusiness_VendorApp.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct MultiBusiness_VendorApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  @StateObject var mainVM = MainViewModel.shared
  @Environment(\.presentationMode) var presentationMode
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        MainView(user: .init(id: "1", name: "ilhan", email: "", phone: ""))
      }
    }
  }
}


