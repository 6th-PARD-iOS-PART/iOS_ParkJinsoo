//
//  Row3_currentmoney.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row3_currentmoney: View {
    @Environment(MoneyContainer.self) var moneyContainer //environment에서 가져옴
    
    var body: some View {
        Text("토스뱅크1000-9047-0710") //토스뱅크 Row
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity, alignment:.leading)
            .padding(.leading,26)
            .padding(.top,89)
        //  .background(Color.red.opacity(0.1))


        HStack{ //현재 금액 Row
            Text(moneyContainer.selectedMoney)
                .font(.system(size:29.8))
                .padding(.leading,28)
            Spacer()
            ZStack{
                Rectangle()
                    .cornerRadius(30)
                    .frame(width:85,height:52)
                    .foregroundStyle(Color.gray.opacity(0.1))
                    .padding(.trailing,25)
                HStack{
                    Image("blackcard")
                        .resizable()
                        .frame(width:12,height:16)
                    Text("카드")
                        .font(.system(size:13.3))
                        .foregroundStyle(.gray)
                }
                .padding(.trailing,25)
                  }
        }
        .frame(height:67)
        //.background(Color.red.opacity(0.1))

        
    }
}

#Preview {
    Row3_currentmoney()
}






