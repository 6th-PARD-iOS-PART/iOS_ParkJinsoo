//
//  Row9_myreceipt.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//

import SwiftUI

struct Row9_myreceipt: View {
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image("receipt")
                    .resizable()
                    .frame(width:21,height:24)
                    .padding(.leading,16)
                Text("내현금영수증")
                    .font(.system(size:15.9))
                    .padding(.leading,26)
                    .foregroundStyle(.gray)
                Spacer()
                Image("arrowbold")
                    .resizable()
                    .frame(width:8,height:13)
                    .padding(.trailing,28)
            }
            Spacer()
            HStack{
                Image("creditcard")
                    .resizable()
                    .frame(width:19,height:25)
                    .padding(.leading,16)
                Text("토스신용카드")
                    .font(.system(size:15.7))
                    .padding(.leading,26)
                    .foregroundStyle(.gray)
                Spacer()
                Image("arrowbold")
                    .resizable()
                    .frame(width:8,height:13)
                    .padding(.trailing,28)
            }
            Spacer()
            HStack{
                Image("calculator")
                    .resizable()
                    .frame(width:21,height:25)
                    .padding(.leading,16)
                Text("더 낸 연말정산 돌려받기")
                    .font(.system(size:15.3))
                    .padding(.leading,26)
                    .foregroundStyle(.gray)
                Spacer()
                Image("arrowbold")
                    .resizable()
                    .frame(width:8,height:13)
                    .padding(.trailing,28)
            }
            Spacer()
        }
        .frame(height:181)

    }
}

#Preview {
    Row9_myreceipt()
}
