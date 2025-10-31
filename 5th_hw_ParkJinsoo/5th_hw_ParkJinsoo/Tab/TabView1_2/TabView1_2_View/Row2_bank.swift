//
//  Row2_bank.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row2_bank: View {
    
    var body: some View {
        HStack(){ //통장 Row
            Text("통장")
                .foregroundStyle(.gray)
                .font(.system(size:18.6))
                .padding(.leading,71)
            Spacer()
            Text("내 토스뱅크")
                .foregroundStyle(.gray)
                .font(.system(size:18.2))
            Spacer()
            Text("상품찾기")
                .foregroundStyle(.gray)
                .font(.system(size:19.6))
                .padding(.trailing,52)
        }
        .frame(height:60)

        Divider() //divider
            .frame(width:100, height: 1)
            .background(Color.black.opacity(0.5))
            .padding(.trailing,230)
        
    }
}

#Preview {
    Row2_bank()
}





