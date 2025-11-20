//
//  Row4_movehowmuch.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/30/25.
//

import SwiftUI

struct Row4_movehowmuch: View {
    @Binding var path: NavigationPath
    @Binding var amount: String
    @Binding var isOn: Bool

    
    var body: some View {
        
        HStack{ //얼마나 옮길까요?
            VStack(alignment:.leading){
                HStack{
                    Text(amount.isEmpty ? "얼마나 옮길까요?" : amount + "원")
                        .font(.system(size:31))
                        .bold()
                        .foregroundStyle(amount.isEmpty ? .gray : .black)
                        .padding(.leading,27)
                        .padding(.top,20)
                    Spacer()
                }
                HStack{
                    Button{ //잔액 누르면 금액 나오기
                        isOn.toggle()
                        if isOn{
                            amount = "26,656"
                        }else{
                            amount = ""
                        }
                        }label:{
                            ZStack{
                                if isOn{
                                    Text("2만6,656원")
                                        .foregroundStyle(.gray)
                                        .font(.system(size:15))
                                        .padding(.leading,30)
                                        .padding(.top,1)
                                }else{
                                    Rectangle()
                                        .fill(.gray.opacity(0.1))
                                        .frame(width:168,height:38)
                                        .cornerRadius(5)
                                        .padding(.leading,26)
                                        .padding(.top,-10)
                                    Text("잔액26,656입력")
                                        .foregroundStyle(.gray)
                                        .bold()
                                        .font(.system(size:15))
                                        .padding(.top,-10)

                            }
                        }
                    }
                }
            }
            .frame(height:110)
        //                    .background(Color.red.opacity(0.1))
        } //얼마나 옮길까요?
        
        Spacer()

        
        let digits = amount.filter { $0.isNumber }
        
        if let inter = Int(digits) {
            if inter < 1 {
                // 금액 0원 이하면 버튼 안보임
                Text("")
                    .padding(.bottom, -30)
            } else if inter <= 26656 {
                // 송금 가능 구간 -> 활성화
                Button{
                    path.append("TabView1_5_Main")
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(height:60)
                            .foregroundColor(Color(red:49/255,
                                                   green:130/255, blue:246/255))
                            .padding(.bottom,20)
                        Text("다음")
                            .font(.system(size:18))
                            .foregroundColor(Color(red:212/255, green:228/255, blue:252/255))
                            .padding(.bottom,20)
                    }
                }
            } else {
                // 송금 불가 구간 → 비활성화
                ZStack{
                    Rectangle()
                        .frame(height:60)
                        .foregroundColor(Color(red:201/255,
                                               green:222/255, blue:252/255))
                        .padding(.bottom,20)
                    Text("다음")
                        .font(.system(size:18))
                        .foregroundColor(Color(red:245/255, green:249/255, blue:254/255))
                        .padding(.bottom,20)
                }
            }
        }
    

         
    }
}

#Preview {
    Row4_movehowmuch(path: .constant(NavigationPath()),
                     amount: .constant(""),
                     isOn: .constant(false)
    )
}
