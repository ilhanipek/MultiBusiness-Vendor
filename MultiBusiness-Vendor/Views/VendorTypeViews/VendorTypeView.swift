//
//  VendorTypeView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 20.04.2024.
//

import SwiftUI

struct VendorTypeView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @StateObject var vendorTypeVM = VendorTypeViewModel.shared
  @StateObject var mainVM = MainViewModel.shared
    var body: some View {
        ZStack {
          Color.custom.background
            .ignoresSafeArea()
          VStack{
            VendorTypeViewTopFiller()

            HStack {
              VStack(alignment: .leading,spacing: 5){
                Text("Discover")
                  .bold()
                  .font(.customfont(.bold, fontSize: Constants.screenWidth / 15))
                Text("Find anything that you want")
                  .font(.customfont(.regular, fontSize: Constants.screenWidth / 20))
                  .foregroundStyle(Color.gray.opacity(0.7))
              }
              .padding(.vertical,5)
              .padding(.horizontal,10)
              Spacer()
            }

            SearchBar(placeholder: "Search \(vendorTypeVM.vendorType?.name)", text: $vendorTypeVM.searchText, isSearching: $vendorTypeVM.isSearching)
              .shadow(radius: 4)

            HStack {
              VStack(alignment: .leading,spacing: 5){
                Text("What are you getting today?")
                  .foregroundStyle(Color.gray.opacity(0.8))
                  .font(.customfont(.bold, fontSize: Constants.screenWidth / 15))
                Text("Find anything that you want")
                  .font(.customfont(.regular, fontSize: Constants.screenWidth / 20))
                  .bold()
              }
              .padding(.top,20)
              .padding(.horizontal,10)
              Spacer()
            }
            
            VStack{
              ScrollView(.vertical) {
                ScrollView(.horizontal) {
                  LazyHStack(content: {
                    if let categories = vendorTypeVM.categories {
                      ForEach(categories,id: \.id) { category in
                        VStack {
                          CategoryCell(imageUrl: "\(category.photo)")
                          Text(category.name)
                        }
                      }
                    }
                  })
                }
                .padding(.leading,10)
              }
            }
          }
          .ignoresSafeArea()
          .tint(.black)
        }
        .overlay(alignment: .center) {
          if mainVM.isProgressing == true{
            ZStack {
              Color.gray.opacity(0.7)
              CustomProgressView(isAnimating: $mainVM.isProgressing)
            }
            .ignoresSafeArea()
          }
        }
        .onAppear{
          mainVM.isProgressing = true
          Task {
            try await vendorTypeVM.getCategories()
            mainVM.isProgressing = false
          }
        }
    }
}

#Preview {
  VendorTypeView()
}
