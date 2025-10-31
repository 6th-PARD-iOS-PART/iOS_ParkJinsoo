//
//  Row2_inputbank.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row2_inputbank: View {
    
    var body: some View {
        HStack{ //계좌 & 연락처 Row
            ZStack{
                Rectangle()
                    .fill(Color(.gray.opacity(0.1)))
                    .frame(width:350,height:50)
                HStack{
                    Spacer()
                    Text("연락처")
                        .font(.system(size:17.4))
                        .foregroundStyle(.gray)
                        .padding(.trailing,100)
                }
                HStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(width:170,height:40)
                            .cornerRadius(10)
                            .padding(.leading,31)
                        Text("계좌")
                            .font(.system(size:18.7))
                            .foregroundStyle(.gray)
                            .padding(.leading,31)
                    }
                    Spacer()
                }
            }
            .padding(.top,30)
            .padding(.bottom,25)
        }


        HStack{ //계좌번호입력 Row
            Text("계좌번호입력")
                .font(.system(size:23))
                .bold()
                .foregroundStyle(.gray)
                .padding(.leading,23)
            Spacer()
            Image("camera")
                .resizable()
                .frame(width:24,height:23)
                .padding(.trailing,35)
        }
        .padding(.bottom,5)
        //                    .background(Color.red.opacity(0.1))

        
    }
}

#Preview {
    Row2_inputbank()
}
