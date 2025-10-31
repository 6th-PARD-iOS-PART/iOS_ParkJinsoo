//
//  Row3_markreceiver.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/30/25.
//

import SwiftUI

struct Row3_markreceiver: View {
    var body: some View {
        
        VStack{
            HStack{
                Text("받는 분에게 표시")
                    .font(.system(size:15))
                    .padding(.leading,20)
                    .foregroundStyle(.gray)
                Spacer()
                Text("유재혁")
                    .font(.system(size:15))
                    .foregroundStyle(.gray)
                Image("arrowbold")
                    .resizable()
                    .frame(width:7,height:13)
                    .padding(.trailing,27)
            }
            .frame(height:46)
        //                    .background(Color.red.opacity(0.1))
            
            HStack{
                Text("출금 계좌")
                    .font(.system(size:15))
                    .padding(.leading,20)
                    .foregroundStyle(.gray)
                Spacer()
                Text("내 토스뱅크 통장")
                    .font(.system(size:15))
                    .foregroundStyle(.gray)
                Image("arrowbold")
                    .resizable()
                    .frame(width:7,height:13)
                    .padding(.trailing,27)
            }
            .frame(height:46)
        //                    .background(Color.red.opacity(0.1))
            
            HStack{
                Text("입금 계좌")
                    .font(.system(size:15))
                    .padding(.leading,20)
                    .foregroundStyle(.gray)
                Spacer()
                Text("하나은행15789165262107")
                    .font(.system(size:16))
                    .foregroundStyle(.gray)
                    .padding(.trailing,27)
            }

            .frame(height:46)
        //                    .background(Color.red.opacity(0.1))
        }

        Rectangle()
            .frame(width:360,height:62)
            .foregroundStyle(.white)
            .cornerRadius(20)

        
        
    }
}

#Preview {
    Row3_markreceiver()
}
