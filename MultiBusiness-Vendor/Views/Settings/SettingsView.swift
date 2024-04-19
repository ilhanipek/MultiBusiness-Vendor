//
//  SettingsView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import SwiftUI

struct SettingsView: View {

    var body: some View {
      RoundButton(title: "Log out") {
        FireBaseAuthService.shared.signOut()
      }
    }
}

#Preview {
    SettingsView()
}
