//
//  CheckoutView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 17.05.2024.
//

import SwiftUI
import CoreLocation

struct CheckoutView: View {

  @StateObject var checkoutVM = CheckoutViewModel()
  @ObservedObject var cartVM = CartViewModel.shared

  var body: some View {
    ZStack {
      Color.custom.background
        .ignoresSafeArea()
      VStack {
        CheckoutTopFiller()
        ScrollView {

        }
        VStack {
          Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
          HStack {
            VStack(alignment: .leading) {
              Text("Total Item")
              Text("Sub-Total")
            }
            .font(.title2)
            .padding(.leading)
            Spacer()
            VStack(alignment: .trailing) {
              Text("\(cartVM.cartQuantity)")
              Text("$\(cartVM.cartPrice)")
            }
            .font(.title)
            .bold()
            .padding(.trailing)
          }
          RoundButton(title: "ORDER") {

          }
        }
        .padding(.bottom)
        Spacer()
      }
    }
    .navigationBarBackButtonHidden()
//    .onAppear {
//      checkoutVM.locationManager.delegate = checkoutVM.locationManagerDelegate
//      checkoutVM.locationManagerDelegate.didChangeAuthorization = { status in
//        if status == .authorizedWhenInUse || status == .authorizedAlways {
//          checkoutVM.fetchLocation()
//        }
//      }
//    }
  }
}

#Preview {
    CheckoutView()
}
