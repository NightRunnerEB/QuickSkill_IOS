import SwiftUI

struct ShopItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let count: Int
    let price: Double?
    let endpoint: String
}

// Пример списка товаров для магазина
let shopItems = [
    ShopItem(icon: "heart.fill", title: "Love Potion", count: 3, price: 99.99, endpoint: "/buy/love-potion"),
    // Добавьте здесь еще 8 элементов...
]

struct ShopTestView: View {
    @State private var selectedShopItem: ShopItem?
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(shopItems) { item in
                    HStack {
                        Image(systemName: item.icon)
                        Text(item.title)
                        Spacer()
                        Text("x\(item.count)")
                        if let price = item.price {
                            Text("$\(price, specifier: "%.2f")")
                        } else {
                            Text("Free")
                        }
                    }
                    .padding()
                    .onTapGesture {
                        self.selectedShopItem = item
                    }
                }
            }
        }
        .alert(item: $selectedShopItem) { item in
            Alert(
                title: Text("Confirm Purchase"),
                message: Text("Are you sure you want to buy \(item.title)?"),
                primaryButton: .destructive(Text("Confirm")) {
                    purchaseItem(item)
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    private func purchaseItem(_ item: ShopItem) {
        // Здесь логика для выполнения покупки, возможно, с отправкой запроса на сервер
        print("Purchasing \(item.title) from \(item.endpoint)")
    }
}

struct ShopTestView_Previews: PreviewProvider {
    static var previews: some View {
        ShopTestView()
    }
}
