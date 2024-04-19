//
//  ShowButton.swift
//  MultiBusiness-Vendor
//
//  Created by ilhan serhan ipek on 9.04.2024.
//

import Foundation
import SwiftUI

struct ShowButton: ViewModifier {
    @Binding var isShow: Bool

    public func body(content: Content) -> some View {

        HStack {
            content
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill")
                    .foregroundColor(.textTitle)
            }
        }
    }
}
