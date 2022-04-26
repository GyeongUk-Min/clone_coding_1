//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by Woogie on 2022/04/21.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var store: Store
    let product: Product
    
    let impackSoft = UIImpactFeedbackGenerator(style: .soft) // 약한 피드백 진동
    
    private var imageName: String {
        product.isFavorite ? "heart.fill":"heart" //즐겨찾기 여부에 따라 심벌 변경
    }
    
    var body: some View {
        Image(systemName: imageName)
            .imageScale(.large)
            .foregroundColor(.peach)
            .frame(width: 32, height: 32)
            .onTapGesture {
                self.store.toggleFavorite(of: self.product)
                impackSoft.impactOccurred()
            }
    }
}
