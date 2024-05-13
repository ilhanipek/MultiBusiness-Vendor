//
//  SearchBar.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

import Foundation
import SwiftUI

struct SearchBar: View {
  @State var placeholder: String = "Placeholder"
  @StateObject var searchVM = SearchViewModel.shared
  var didCommit : (()->())?
    var body: some View {
        HStack {
          Image("search")
              .resizable()
              .scaledToFit()
              .frame(width: 20, height: 20)
              .padding(.leading,5)

          TextField("Search", text: $searchVM.searchText,onCommit: {
            searchVM.filtredVendors?.removeAll()
            didCommit?()
          })
            .font(.customfont(.regular, fontSize: 17))
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .frame(minWidth: 0, maxWidth: Constants.screenWidth - 40)
                .onTapGesture {
                  withAnimation(.spring) {
                    searchVM.isSearching = true
                    searchVM.filtredVendors?.removeAll()
                    searchVM.isSearched = true
                  }
                }

            if searchVM.isSearching {
                Button(action: {
                  searchVM.searchText = ""
                  searchVM.filtredVendors = searchVM.vendors?.data
                  withAnimation(.spring) {
                    searchVM.isSearching = false
                  }
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("return")
                        .padding(.trailing, 8)
                        .foregroundStyle(Color.custom.primary)
                }
            }
        }
        .frame(height: 30)
        .padding(.vertical,10)
        .background(Color.white)
        .cornerRadius(12)
        .onTapGesture {
          searchVM.searchText = ""
        }
    }
}

#Preview {
  SearchBar()
}
