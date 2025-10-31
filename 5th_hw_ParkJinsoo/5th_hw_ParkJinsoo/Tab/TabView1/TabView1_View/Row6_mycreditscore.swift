//
//  Row6_mycreditscore.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//

import SwiftUI

struct Row6_mycreditscore: View {
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image("checkbox")
                    .resizable()
                    .frame(width:34,height:34)
                    .padding(.leading,16)
                Text("내 신용점수")
                    .font(.system(size:15))
                    .padding(.leading,5)
                Spacer()
                ZStack{
                    Rectangle()
                        .frame(width:80,height:43)
                        .foregroundStyle(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    Text("확인하기")
                        .font(.system(size:13.5))
                        .foregroundStyle(.gray)
                }
                .padding(.trailing,19)
            }
            Spacer()
            HStack(spacing:50){
                Text("계좌개설")
                Text("카드발급")
                Text("대출받기")
            }
            .font(.system(size:15))
            .foregroundStyle(.gray)
            Spacer()
        }
        .frame(height:128)

        
    }
}

#Preview {
    Row6_mycreditscore()
}
