import SwiftUI

struct CustomProgressView: View {
    enum ProgressTag {
        case fourth
        case fifth
        case sixth
        case seventh
        case eighth
    }

    @Binding var isAnimating: Bool
    @State var firstCircleWidth: CGFloat = 25
    @State var secondCircleWidth: CGFloat = 25
    @State var thirdCircleWidth: CGFloat = 25
    @State var fourthCircleWidth: CGFloat = 25
    @State var fifthCircleWidth: CGFloat = 0
    @State var sixthCircleWidth: CGFloat = 0
    @State var seventhCircleWidth: CGFloat = 0
    @State var eighthCircleWidth: CGFloat = 0
    @State var progressTagArray: [ProgressTag] = [.fifth, .sixth, .seventh, .eighth]

    var body: some View {

      ZStack {
        VStack {
              HStack {
                  Circle().foregroundStyle(Color.custom.primary).frame(width: firstCircleWidth)
                  Circle().frame(width: secondCircleWidth)
                  Circle().foregroundStyle(Color.custom.primary).frame(width: thirdCircleWidth)
                  Circle().frame(width: fourthCircleWidth)
                  Circle().frame(width: fifthCircleWidth).foregroundStyle(Color.custom.primary).padding(0)
                  Circle().frame(width: sixthCircleWidth).padding(0)
                  Circle().frame(width: seventhCircleWidth).foregroundStyle(Color.custom.primary).padding(0)
                  Circle().frame(width: eighthCircleWidth).padding(0)
              }
          }

          .onAppear {
              runAnimation()
        }
      }
      .frame(width: 20, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }

    private func runAnimation() {
        guard isAnimating else {
            // Animasyonu durdur
            return
        }

        // Tüm daire genişliklerini sıfırla
        resetCircleWidths()

        // Döngü içinde her bir adımı işle
        for (index, step) in progressTagArray.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index + 1) * 0.7) {
                withAnimation {
                    updateCircleWidths(for: step)
                }
                // Son adımı işledikten sonra animasyonu yeniden başlat
                if index == progressTagArray.count - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        runAnimation()
                    }
                }
            }
        }
    }

    private func resetCircleWidths() {
        firstCircleWidth = 25
        secondCircleWidth = 25
        thirdCircleWidth = 25
        fourthCircleWidth = 25
        fifthCircleWidth = 0
        sixthCircleWidth = 0
        seventhCircleWidth = 0
        eighthCircleWidth = 0
    }

    private func updateCircleWidths(for step: ProgressTag) {
        switch step {
        case .fifth:
            firstCircleWidth = 0
            fifthCircleWidth = 25
        case .sixth:
            secondCircleWidth = 0
            sixthCircleWidth = 25
        case .seventh:
            thirdCircleWidth = 0
            seventhCircleWidth = 25
        case .eighth:
            fourthCircleWidth = 0
            eighthCircleWidth = 25
        case .fourth:
          print("")
        }
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(isAnimating: .constant(true))
    }
}
