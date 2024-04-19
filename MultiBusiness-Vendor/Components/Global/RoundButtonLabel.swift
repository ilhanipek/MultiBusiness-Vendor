//
//  RoundButtonLabel.swift
//  MultiVendor
//
//  Created by ilhan serhan ipek on 29.02.2024.
//

import SwiftUI

struct RoundButtonLabel: View {
  var title: String
  var color : Color
    var body: some View {
      Text(title)
          .font(.customfont(.semibold, fontSize: 18))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
          .background(color)
          .cornerRadius(20)
    }
}

#Preview {
  RoundButtonLabel(title: "sdfsd", color: .custom.primary)
}
