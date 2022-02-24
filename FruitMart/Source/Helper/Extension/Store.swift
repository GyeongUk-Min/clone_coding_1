//
//  Store.swift
//  FruitMart
//
//  Created by Woogie on 2022/01/31.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import Foundation

final class Store {
    var products: [Product]
    
    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
