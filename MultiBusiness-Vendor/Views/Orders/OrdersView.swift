//
//  FavoritesView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import SwiftUI

struct OrdersView: View {
  @StateObject var mainVM = MainViewModel.shared
    var body: some View {
      ZStack{
        Color.custom.background
          .ignoresSafeArea()
        if mainVM.currentUser == nil {
          VStack{
            OrdersTopFiller()
            Spacer()
            VStack{
              Image(uiImage: UIImage(named: "auth")!)
                .resizable()
                .frame(width: Constants.screenWidth / 4, height: Constants.screenWidth / 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

              NavigationLink {
                SignInView()
              } label: {
                Text("Login")
                  .foregroundStyle(Color.white)
                  .font(.customfont(.regular, fontSize: Constants.screenWidth / 20))
                  .frame(width: Constants.screenWidth - 50, height: Constants.screenWidth / 8, alignment: .center)
                  .background{
                    Color.custom.primary
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  }
              }
            }
            Spacer()
          }
        } else {
          /// ORDERS
        }
      }
    }
}

#Preview {
  OrdersView()
}
