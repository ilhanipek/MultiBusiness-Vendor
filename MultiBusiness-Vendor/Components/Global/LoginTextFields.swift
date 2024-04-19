//
//  LineTextField.swift
//  MultiVendor
//
//  Created by ilhan serhan ipek on 29.02.2024.
//

import SwiftUI

struct LineTextField: View {
  @State var title: String = "Title"
  @State var placholder: String = "Placholder"
  @Binding var txt: String
  @State var keyboardType: UIKeyboardType = .default


  var body: some View {
    VStack {
      Text(title)
        .font(.customfont(.semibold, fontSize: 16))
        .foregroundColor(.textTitle)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)


      TextField(placholder, text: $txt)
        .keyboardType(keyboardType)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .frame(height:40)

      Divider()

    }
  }
}

struct LineSecureField: View {
  @State var title: String = "Title"
  @State var placholder: String = "Placholder"
  @Binding var txt: String
  @Binding var isShowPassword: Bool


  var body: some View {
    VStack {
      Text(title)
        .font(.customfont(.semibold, fontSize: 16))
        .foregroundColor(.textTitle)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

      if (isShowPassword) {
        TextField(placholder, text: $txt)
          .disableAutocorrection(true)
          .autocapitalization(.none)
          .modifier( ShowButton(isShow: $isShowPassword))

          .frame(height:40)
      }else{
        SecureField(placholder, text: $txt)
          .autocapitalization(.none)
          .modifier( ShowButton(isShow: $isShowPassword))
          .frame(height:40)

      }
      Divider()
    }
  }
}

struct PhoneTextField : View {
  @State var title: String = "Title"
  @State var placholder: String = "Placeholder"
  @Binding var txt: String
  @State var keyboardType: UIKeyboardType = .numberPad
  @Binding var countryCode : CountryCode
  var countryCodeTap: (()->())?

  var body: some View {
    VStack {
      Text(title)
        .font(.customfont(.semibold, fontSize: 16))
        .foregroundColor(.textTitle)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

      HStack {
        Button {
          countryCodeTap!()
        } label: {
          FlagCode(flagName: $countryCode.image, phoneCode: $countryCode.countryCode)
        }
        .tint(Color.black)

        TextField(placholder, text: $txt)
          .keyboardType(keyboardType)
          .autocapitalization(.none)
          .disableAutocorrection(true)
      }
      .frame(height:40)

      Divider()
    }
  }
}

struct FlagCode : View {
  @Binding var flagName : String
  @Binding var phoneCode: String
  var body: some View {
    HStack {
      Image(flagName)
        .resizable()
        .frame(width: Constants.screenWidth/10, height: Constants.screenWidth/10, alignment: .center)
      Text("+\(phoneCode)")
        .font(.customfont(.regular, fontSize: Constants.screenWidth/20))
    }
  }
}

#Preview {
  FlagCode(flagName: .constant("turkey_flag"), phoneCode: .constant("90"))
}
