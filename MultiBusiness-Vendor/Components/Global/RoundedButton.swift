//
//  RoundedButton.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 9.04.2024.
//

import Foundation
import SwiftUI

struct RoundButton: View {
    var title: String = "Title"
    var didTap: (()->())?

    var body: some View {
        Button {
            didTap?()
        } label: {
          RoundButtonLabel(title: title, color: Color.custom.primary)
        }

    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}

