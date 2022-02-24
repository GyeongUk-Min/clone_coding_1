//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    let store: Store
    
    var body: some View {
        NavigationView {
            List(store.products) { product in
                if #available(iOS 14.0, *) {
                    NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductRow(product: product)
                    }
                    .navigationTitle("과일마트")
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home(store: Store())
  }
}

//제품
//struct ProductRow: View {
//    var body: some View {
//        HStack {
//            //상품 이미지
//            Image("apple")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 140)
//                .clipped()
//
//            VStack(alignment: .leading) {
//                //상품명
//                Text("사과")
//                    .font(.headline)
//                    .fontWeight(.medium)
//                    .padding(.bottom, 6)
//
//                //상품설명
//                Text("달콤한 맛이 나는 사과")
//                    .font(.footnote)
//                    .foregroundColor(.secondary)
//
//                Spacer()
//
//                HStack(spacing: 0) {
//
//                    //가격 정보
//                    Text("￦ ").font(.footnote)
//                    + Text("2100").font(.headline)
//
//                    Spacer()
//
//                    //좋아요
//                    Image(systemName: "heart")
//                        .imageScale(.large)
//                        .foregroundColor(Color("peach"))
//                        .frame(width: 32, height: 32)
//
//                    //카트에 담기
//                    Image(systemName: "cart")
//                        .imageScale(.large)
//                        .foregroundColor(Color("peach"))
//                        .frame(width: 32, height: 32)
//                }
//            }
//            .padding([.leading, .bottom], 12)
//            .padding([.top, .trailing])
//        }
//        .frame(height: 150)
//        .background(Color.primary.colorInvert())
//        .cornerRadius(8)
//        //그림자
//        .shadow(color: Color.primary.opacity(0.33), radius: 1, x: 2, y: 2)
//        .padding(.vertical, 8)
//        .padding(.horizontal, 5)
//    }
//}
//



//VStack {
//    ProductRow(product: productSamples[0])
//    ProductRow(product: productSamples[1])
//    ProductRow(product: productSamples[2])
//    //버튼 구현
//    HStack {
//        Button(action: {
//            print("Button_1")
//        }) {
//            Text("Button1")
//        }
//        .buttonStyle(DefaultButtonStyle())
//
//        Button(action: { print("Button_2")}) {
//            Text("Button2")
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
//        }
//
//        Button(action: { print("Button_3")}) {
//            Circle()
//                .stroke(lineWidth: 2)
//                .frame(width: 80, height: 80)
//                .overlay(Text("Button3"))
//        }
//        .accentColor(.green)
//
//    }
//
//    HStack {
//        Button(action: {
//            print("Button_4")
//
//        }) {
//            Text("SwiftUI")
////                        .renderingMode(.original)
////                        .resizable()
////                        .frame(width: 120, height: 120)
//        }.padding()
//
//        Button(action: { print("Button_5") }) {
//            Image(systemName: "play.circle")
//                .imageScale(.large)
//                .font(.largeTitle)
//        }.padding()
//
//        //네이게이션 뷰 구현
//        NavigationView {
//            if #available(iOS 14.0, *) {
//                NavigationLink(destination: Text("Destination View")) {
//                    Image(systemName: "bell")
//                }
//                .navigationTitle("네비게이션 뷰")
//            } else {
//                // Fallback on earlier versions
//            }
//        }
//    }
//}
