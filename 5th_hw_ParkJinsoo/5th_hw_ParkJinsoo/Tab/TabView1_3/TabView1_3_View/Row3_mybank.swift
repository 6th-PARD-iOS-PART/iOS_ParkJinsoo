//
//  Row3_mybank.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row3_mybank: View {
    var body: some View {
        
        Rectangle() //grayLine
            .frame(width:350,height:2)
            .foregroundStyle(.gray.opacity(0.1))
            .padding(.bottom,17)


        HStack{ //내 계좌 Row
            Text("내 계좌")
                .font(.system(size:17))
                .padding(.leading,27)
                .fontWeight(.light)
            Spacer()
            Text("+18개")
                .font(.system(size:15))
                .foregroundStyle(.gray)
                .padding(.trailing,13)
            Image("arrowbold")
                .resizable()
                .frame(width:7,height:13)
                .padding(.trailing,27)
        }
        .frame(height:53)
        //                    .background(Color.red.opacity(0.1))


        
    }
}

#Preview {
    Row3_mybank()
}
