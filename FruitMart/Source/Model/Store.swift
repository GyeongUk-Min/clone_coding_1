//
//  Store.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

final class Store: ObservableObject {
    @Published var products: [Product] // @published -> 특정 상품의 데이터가 변경되면 관련된 뷰들이 인시갛고 화면을 올바르게 갱신 가능하게 해준다.
    @Published var orders: [Order] = [] // 전체 주문 목록
        // MARK: Initialization
    
    init(filename: String = "ProductData.json") {
      self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
    
    func placeOrder(product: Product, quantity: Int) {
        let nextID = Order.orderSequence.next()!
        let order = Order(id: nextID, product: product, quantity: quantity)
        orders.append(order)
    }
}

extension Store {
    func toggleFavorite(of product: Product) {
        guard let index = products.firstIndex(of: product) else { return }
        products[index].isFavorite.toggle()
    }
}
