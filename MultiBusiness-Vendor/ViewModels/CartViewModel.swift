// CartViewModel.swift

import Foundation

class CartViewModel: ObservableObject {
    @Published var productsWithQuantity: [ProductWithQuantity] = []
    static let shared = CartViewModel()

    func saveToCart(product: Product, for key: String) {
        do {
            var cartProducts = loadCart(for: key)
            if let existingProductIndex = cartProducts.firstIndex(where: { $0.product.id == product.id }) {
                cartProducts[existingProductIndex].quantity += 1
            } else {
                cartProducts.append(ProductWithQuantity(product: product, quantity: 1))
            }
            let data = try JSONEncoder().encode(cartProducts)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Error saving to cart: \(error)")
        }
    }

    func loadCart(for key: String) -> [ProductWithQuantity] {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let cartProducts = try JSONDecoder().decode([ProductWithQuantity].self, from: data)
                self.productsWithQuantity = cartProducts
                return cartProducts
            } catch {
                print("Error loading cart: \(error)")
            }
        }
        return []
    }

  func removeProduct(at index: Int) {
          productsWithQuantity.remove(at: index)

          do {
              let data = try JSONEncoder().encode(productsWithQuantity)
              UserDefaults.standard.set(data, forKey: "Cart")
          } catch {
              print("Error saving to cart: \(error)")
          }
      }
}

struct ProductWithQuantity: Codable, Identifiable {
    var id = UUID()
    let product: Product
    var quantity: Int
}
