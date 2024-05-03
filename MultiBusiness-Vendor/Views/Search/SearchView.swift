//
//  SearchView2.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 29.03.2024.
//

import SwiftUI

struct SearchView: View {
  @State var text = ""
  @State var isSearching = false
  @State private var progressValue: Float = 0.5
  @State var isProgressShowing = false
  @State var isProgressing = false
  @StateObject var searchVM = SearchViewModel.shared
  @StateObject var mainVM = MainViewModel.shared 
  @State var isDisabled = false
  let gridItems : [GridItem] = [
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1)
  ]
  var body: some View {
    ZStack{
      Color.custom.background
        .ignoresSafeArea()
      VStack{
        SearchTopFiller()
        HStack{
          SearchBar(text: $text, isSearching: $isSearching) {
            DispatchQueue.main.async{
              print("dsfsdfsfsdfdsfsdfssdfdsfsdf")
              text = ""
              isSearching = false
            }
          }
            .padding(.leading,5)
          Button(action: {
            
          }, label: {
            ZStack{
              RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.white)
                .frame(width: 50, height: 50, alignment: .center)
              Image(systemName: "line.3.horizontal.decrease.circle.fill")
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(Color.custom.primary)
                .frame(width: 40, height: 40, alignment: .center)
            }
            .padding(.horizontal,5)
          })
        }
        
        HStack{
          Selectionbar(leftBarAction: {
            mainVM.isProgressing = true
            isDisabled = true
            Task{
              try await searchVM.getSearchVendors()
              mainVM.isProgressing = false
              isDisabled = false
            }

          }, middleBarAction: {
            mainVM.isProgressing = true
            isDisabled = true
            Task{
              try await searchVM.getProducts()
              mainVM.isProgressing = false
              isDisabled = false
            }

          }, rightBarAction: {
            mainVM.isProgressing = true
            isDisabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
              print("End")
              mainVM.isProgressing = false
              isDisabled = false
            })
          })
          .padding(.leading,5)
          Spacer()
        }

        ZStack {
          if searchVM.barPosition == .left {
            if let data = searchVM.vendors {
              ScrollView {
                LazyVGrid(columns: gridItems, content: {
                  ForEach(data.data,id: \.id) { vendor in
                    SearchViewVendorCell(vendor: vendor)
                      .padding(.top)
                  }
                })
              }
            }
          } else if searchVM.barPosition == .middle {
            if let data = searchVM.products{
              ScrollView {
                LazyVGrid(columns: gridItems,spacing: 5, content: {
                  ForEach(data.data,id: \.id) { product in
                    NavigationLink {
                      ProductDetailView(product: product)
                    } label: {
                      SearchViewProductCell(product: product)
                        .tint(Color.black )
                    }
                  }
                })
              }
            }
          }
        }
        Spacer()
      }
      if mainVM.isProgressing == true{
        ZStack {
          CustomProgressView(isAnimating: $mainVM.isProgressing)
        }
        .ignoresSafeArea()
      }
    }
    .disabled(mainVM.isProgressing)
  }
}
#Preview {
    SearchView()
}

