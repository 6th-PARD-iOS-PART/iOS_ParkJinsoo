//
//  Row7_payhistory.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row7_payhistory: View {
    
    var body: some View {
        ForEach(PaymentData.payment.indices, id: \.self){ sectionIndex in //2차 배열로 PaymentData 그리기
            if sectionIndex == 1{
                HStack{
                    Text("3월 21일")
                        .font(.system(size:13.5))
                        .foregroundStyle(.gray)
                        .padding(.leading,27)
                        .padding(.top,24)
                    Spacer()
                }
            }
            ForEach(PaymentData.payment[sectionIndex]){ item in
                PaymentCell(data: item)
                    .padding(.top,24)
            }
        }
        
    }
}

#Preview {
    Row7_payhistory()
}
