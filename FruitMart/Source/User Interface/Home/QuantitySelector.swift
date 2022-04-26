//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by Woogie on 2022/03/22.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int // 상위 뷰를 이용해 전달받은 숫자를 표기 및 변경값을 동기화 ( 직접 소유할 필요가 없으므로 Binding 사용
    var range: ClosedRange<Int> = 1...20 // 수량 선택 가능 범위
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let mediumFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        HStack {
            Button(action: {self.changeQuantity(-1)}) { // 수량 감소 버튼
                Image(systemName: "minus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.7))
            
            Text("\(quantity)")  // 현재 수량
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(minWidth: 40, maxWidth: 60)

            Button(action: {self.changeQuantity(1)}) { // 수량 증가 버튼
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.7))
        }
    }
    
    private func changeQuantity(_ num:Int) {
        if range ~= quantity + num {    // 지정된 범위(1~20) 내에서 변경되는 경우 값 변경
            quantity += num
            softFeedback.prepare() //진동 지연 시간을 줄일 수 있도록 준비시키는 매소드
            softFeedback.impactOccurred(intensity: 0.8) //수량이 변경되었을 때 지정 범위 내 값이면 부드러운 진동이 울림
        } else {
            mediumFeedback.prepare()
            mediumFeedback.impactOccurred() // 수량이 변경되었을 때 범위를 벗어날 경우 더 강한 진동 피드백 발생
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuantitySelector(quantity: .constant(1))
            QuantitySelector(quantity: .constant(10))
            QuantitySelector(quantity: .constant(20))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
