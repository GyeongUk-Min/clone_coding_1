//
//  ProductRow.swift
//  FruitMart
//
//  Created by Woogie on 2021/12/06.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            //상품이미지
            ProductImage
            //상품설명
            ProductDescription
        }
        .frame(height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(8)
        .shadow(color: Color.primaryShadow, radius: 1, x: 2, y: 2)
        .padding(.vertical, 8)
        .padding(.horizontal, 5)
    }
    
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productSamples[0])
    }
}

private extension ProductRow {
    
    // 상품이미지
    var ProductImage: some View {
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
    // 상품설명
    var ProductDescription: some View {
        
        VStack(alignment: .leading) {
            //상품명
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            //상품설명
            Text(product.description)
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
            
            footerView
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
    // 상품가격 및 기타
    var footerView: some View {
        HStack(spacing: 0) {
            
            //가격 정보
            Text("￦ ").font(.footnote)
            + Text("\(product.price)").font(.headline)
            
            Spacer()
            
            //좋아요
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
            
            //카트에 담기
            Image(systemName: "cart")
                .imageScale(.large)
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
        }
    }
}
