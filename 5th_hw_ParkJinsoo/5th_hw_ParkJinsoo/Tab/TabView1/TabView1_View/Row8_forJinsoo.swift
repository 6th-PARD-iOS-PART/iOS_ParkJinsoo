//
//  Row8_forJinsoo.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//

import SwiftUI

struct Row8_forJinsoo: View {
    
    var body: some View {
        HStack{
            ZStack{ //rectangle 좌우로 생성
                RoundedRectangle(cornerRadius:25)
                    .fill(Color.white)
                    .frame(height:85)
                HStack{
                    VStack{
                        Text("혜택받는")
                            .font(.system(size:16.3))
                            .foregroundColor(Color(red: 92/255, green: 96/255, blue: 102/255))
                            .padding(.leading,22)
                        Text("체크카드")
                            .font(.system(size:15.4))
                            .foregroundColor(Color(red: 92/255, green: 96/255, blue: 102/255))
                            .padding(.leading,22)
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        Image("yellowcard")
                            .resizable()
                            .frame(width:57,height:58)
                            .padding(.trailing,20)
                    }
                }
            }
            ZStack{
                Rectangle()
                    .fill(Color.white)
                    .frame(height:85)
                    .cornerRadius(25)
                HStack{
                    VStack(alignment:.leading){
                        Text("내 카드보다")
                            .font(.system(size:15.3))
                            .foregroundColor(Color(red: 92/255, green: 96/255, blue: 102/255))
                            .padding(.leading,22)
                        Text("혜택받기")
                            .font(.system(size:16.7))
                            .foregroundColor(Color(red: 92/255, green: 96/255, blue: 102/255))
                            .padding(.leading,22)
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        Image("bluecard")
                            .resizable()
                            .frame(width:57,height:58)
                            .padding(.trailing,20)
                    }
                }
            }
        }
        .background(Color.gray.opacity(0.1)) //배경색 조정

    }
}

#Preview {
    Row8_forJinsoo()
}

