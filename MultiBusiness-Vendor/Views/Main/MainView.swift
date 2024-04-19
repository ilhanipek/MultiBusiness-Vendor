//
//  BottomTabBar.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import SwiftUI

struct MainView: View {
  
  @StateObject var mainVM = MainViewModel.shared
  let user: User
  
  var body: some View {
    ZStack{
      Color.custom.background
        .ignoresSafeArea()
      VStack{
        if(mainVM.selectTab == 0) {
          HomeView()
        }else if(mainVM.selectTab == 1) {
          OrdersView()
        }else if(mainVM.selectTab == 2) {
          CartView()
        }else if(mainVM.selectTab == 3) {
          SearchView()
        }else if(mainVM.selectTab == 4) {
          SettingsView()
        }
        
        Spacer()

        HStack{
          TabButton(title: "Shop", icon: "store_tab", isSelect: mainVM.selectTab == 0) {
            
            print("Button Tab")
            
            DispatchQueue.main.async {
              
              withAnimation {
                mainVM.selectTab = 0
              }
            }
          }

          TabButton(title: "Orders", icon: "a_order", isSelect: mainVM.selectTab == 1) {
            DispatchQueue.main.async {
              withAnimation {
                mainVM.selectTab = 1
              }
            }
          }
          
          TabButton(title: "Cart", icon: "cart_tab", isSelect: mainVM.selectTab == 2) {
            DispatchQueue.main.async {
              
              withAnimation {
                mainVM.selectTab = 2
              }
            }
          }
          
          TabButton(title: "Explore", icon: "explore_tab", isSelect: mainVM.selectTab == 3) {
            DispatchQueue.main.async {
              withAnimation {
                mainVM.selectTab = 3
              }
            }
          }
          TabButton(title: "Account", icon: "Settings", isSelect: mainVM.selectTab == 4) {
            DispatchQueue.main.async {
              withAnimation {
                mainVM.selectTab = 4
              }
            }
          }
        }
        .padding(.top, 10)
        .padding(.bottom,20)
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(15)
      }
    }
    .navigationTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    .ignoresSafeArea(.all, edges: .bottom)
  }
}
#Preview {
  MainView(user: .init(id: "0", name: "", email: "", phone: ""))
}
