//
//  CartView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import SwiftUI

struct CartView: View {
    var body: some View {
      ZStack{
        Color.custom.background
          .ignoresSafeArea()
        VStack{
          CartTopFiller()
          Spacer()
        }
      }
    }
}

#Preview {
    CartView()
}
