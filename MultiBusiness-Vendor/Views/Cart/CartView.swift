//
//  CartView.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 27.03.2024.
//

// CartView.swift

import SwiftUI

struct CartView: View {
    @StateObject var cartVM = CartViewModel.shared

    var body: some View {
        ZStack {
            Color.custom.background
                .ignoresSafeArea()
            VStack {
                CartTopFiller()
                VStack {
                    ForEach(cartVM.productsWithQuantity.indices, id: \.self) { index in
                        CartProductCell(productWithQuantity: cartVM.productsWithQuantity[index]) {
                            // Closure to handle delete action
                            cartVM.removeProduct(at: index)
                        }
                        .padding(.vertical, 5)
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            cartVM.loadCart(for: "Cart")
            print(cartVM.productsWithQuantity)
        }
    }
}



#Preview {
    CartView()
}
