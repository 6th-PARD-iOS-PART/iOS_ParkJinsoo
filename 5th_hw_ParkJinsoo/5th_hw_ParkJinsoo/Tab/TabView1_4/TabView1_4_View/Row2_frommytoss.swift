//
//  Row3_mybank.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row2_frommytoss: View {
    var body: some View {
        
        HStack{ //내 토스뱅크 통장에서
            VStack(alignment:.leading){
                HStack{
                    Text("내 토스뱅크 통장")
                        .foregroundStyle(.black)
                        .bold()
                        .font(.system(size:22))
                        .padding(.leading,27)
                    Text("에서")
                        .foregroundStyle(.gray)
                        .font(.system(size:22))
                        .padding(.leading,-5)
                    Spacer()
                }
                HStack{
                    Text("잔액 26,656원")
                        .foregroundStyle(.gray)
                        .bold()
                        .font(.system(size:15))
                        .padding(.leading,27)
                        .padding(.top,4)
                    Spacer()
                }
            }
            .frame(height:90)
            //                    .background(Color.red.opacity(0.1))
            
            
        }
    }
}

#Preview {
    Row2_frommytoss()
}
