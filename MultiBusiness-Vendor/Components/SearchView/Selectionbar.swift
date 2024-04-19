
import Foundation
import SwiftUI

struct Selectionbar: View {

  @State var selectedIndex = 0
  @State private var barOffset: CGFloat = -76
  
  var leftBarAction: ( ()->() )?
  var middleBarAction: ( ()->() )?
  var rightBarAction: ( ()->() )?

  @StateObject var searchVM = SearchViewModel.shared

  var body: some View {
    VStack {

      HStack(spacing: 5){
        Button("Vendors") {
          selectedIndex = 0
          searchVM.barPosition = .left
        leftBarAction?()
        }
        .font(.customfont(.regular, fontSize: Constants.screenWidth / 27))
        .foregroundStyle(searchVM.barPosition == .left ? Color.white : Color.custom.primary)
        .frame(width: Constants.screenWidth / 5.5, height: Constants.screenWidth / 12, alignment: .center)
        .background{
          RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(searchVM.barPosition == .left ? Color.custom.primary : Color.white )
        }
        Button("Products") {
          selectedIndex = 1
          searchVM.barPosition = .middle
          middleBarAction?()
        }
        .font(.customfont(.regular, fontSize: Constants.screenWidth / 27))
        .foregroundStyle(searchVM.barPosition == .middle ? Color.white : Color.custom.primary)
        .frame(width: Constants.screenWidth / 5.5, height: Constants.screenWidth / 12, alignment: .center)
        .background{
          RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(searchVM.barPosition == .middle ? Color.custom.primary : Color.white )
        }
        Button("Services") {
          selectedIndex = 2
          searchVM.barPosition = .right
          rightBarAction?()
        }
        .font(.customfont(.regular, fontSize: Constants.screenWidth / 27))
        .foregroundStyle(searchVM.barPosition == .right ? Color.white : Color.custom.primary)
        .frame(width: Constants.screenWidth / 5.5, height: Constants.screenWidth / 12, alignment: .center)
        .background{
          RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(searchVM.barPosition == .right ? Color.custom.primary : Color.white )
        }

      }
      .onChange(of: selectedIndex, perform: { value in
        withAnimation {
          switch value {
          case 0:
            barOffset = -76
          case 1:
            barOffset = 0
          case 2:
            barOffset = 76
          default:
            break
          }
        }
      })
      RoundedRectangle(cornerRadius: 10)
        .frame(width: ((Constants.screenWidth / 5.5) * 3) + 10, height: 10)
        .foregroundColor(.custom.background)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .frame(width: Constants.screenWidth / 5.7, height: Constants.screenWidth / 80)
            .foregroundColor(.custom.primary)
            .offset(x: barOffset, y: 0)
        )
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Selectionbar()
    }
}
