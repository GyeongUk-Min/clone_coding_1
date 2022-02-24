//
//  ColorExtension.swift
//  FruitMart
//
//  Created by Woogie on 2021/12/13.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex) // 문자열 파서 역할을 하는 클래스
        _ = scanner.scanString("#") // "#" 문자 제거
        
        var rgb : UInt64 = 0 // 문자열을 Int64타입으로 변환해 RGB 변수에 저장, 변환이 안되면 0반환
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0  //좌측 문자열 2개 추출
        let g = Double((rgb >> 8) & 0xFF) / 255.0  //좌측 문자열 2개 추출
        let b = Double((rgb >> 0) & 0xFF) / 255.0  //좌측 문자열 2개 추출
        self.init(red: r, green: g, blue: b)
    }
    static let peach = Color("peach") // 메인색
    static let primaryShadow = Color.primary.opacity(0.2) // 그림자색
    static let secondaryText = Color(hex: "#6e6e6e") // 진한 회색
    static let background = Color(UIColor.systemGray6)
}

//struct ColorExtension: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ColorExtension_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorExtension()
//    }
//}
