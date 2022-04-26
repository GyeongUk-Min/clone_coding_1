//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
  let product: Product
    @State private var quantity: Int = 1
    @State private var showingAlert: Bool = false
    @EnvironmentObject private var store: Store
  // MARK: Body
  
  var body: some View {
    VStack(spacing: 0) {
      productImage
      orderView
    }
    .edgesIgnoringSafeArea(.top)
    .alert(isPresented: $showingAlert) { confirmAlert }
  }
}


private extension ProductDetailView {
  // MARK: View
  
  var productImage: some View {
    GeometryReader { _ in
      Image(self.product.imageName)
        .resizable()
        .scaledToFill()
    }
  }
  
  var orderView: some View {
    GeometryReader {
      VStack(alignment: .leading) {
        self.productDescription
        Spacer()
        self.priceInfo
        self.placeOrderButton
      }
      .frame(height: $0.size.height - 10)
      .padding(32)
      .background(Color.white)
      .cornerRadius(16)
      .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: -5)
    }
  }

  var productDescription: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Text(product.name)
          .font(.largeTitle).fontWeight(.medium)
          .foregroundColor(.black)
        
        Spacer()
        
        FavoriteButton(product: product)
      }
      
      Text(splitText(product.description))
        .foregroundColor(.secondaryText)
        .fixedSize()
    }
  }
  
  var priceInfo: some View {
    let price = quantity * product.price // 수량 * 상품 가격
    return HStack {
          (Text("₩")
            + Text("\(price)").font(.title)
            ).fontWeight(.medium)
          Spacer()
          QuantitySelector(quantity: $quantity)
        }
        .foregroundColor(.black)
  }
  
  var placeOrderButton: some View {
    Button(action: {
        self.showingAlert = true //주문하기 버튼 터치 시 알림창 출력
    }) {
      Capsule()
        .fill(Color.peach)
        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
        .overlay(Text("주문하기")
          .font(.system(size: 20)).fontWeight(.medium)
          .foregroundColor(Color.white))
        .padding(.vertical, 8)
    }
      
  }
    //알림창 표시 내용 정의
    var confirmAlert: Alert {
        Alert(title: Text("주문 확인"), message: Text("\(product.name)을(를) \(quantity)개 구매하시겠습니까?"), primaryButton: .default(Text("확인"), action: {
            self.placeOrder()
        }),
        secondaryButton: .cancel(Text("취소"))
        )
    }
    
    func placeOrder() {
        store.placeOrder(product: product, quantity: quantity)
    }
  
  // MARK: Computed Values
  
  func splitText(_ text: String) -> String {
    guard !text.isEmpty else { return text }
    let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
    let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
      ?? text[centerIdx...].firstIndex(of: " ")
      ?? text.index(before: text.endIndex)
    let afterSpaceIdx = text.index(after: centerSpaceIdx)
    let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
    let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
    return String(lhsString + "\n" + rhsString)
  }
}


// MARK: - Previews

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let source1 = ProductDetailView(product: productSamples[0])
    let source2 = ProductDetailView(product: productSamples[1])
    return Group {
//      Preview(source: source1)
      Preview(source: source2, devices: [.iPhone11Pro], displayDarkMode: false)
    }
  }
}
