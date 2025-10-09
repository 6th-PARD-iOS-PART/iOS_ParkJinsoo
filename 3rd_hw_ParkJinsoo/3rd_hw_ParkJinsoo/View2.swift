//
//  View2.swift
//  3rd_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/9/25.
//

import SwiftUI

struct View2: View {
    var body: some View {
//        NavigationStack{
            ZStack{
                Color.white.ignoresSafeArea()
                ScrollView{
                    VStack(spacing:0){
                        

                        HStack{ // 통장관리 Row
                            Image("arrowleft")
                                .resizable()
                                .frame(width:12,height:21)
                                .padding(.leading,20)
                            Spacer()
                            Text("통장관리")
                                .foregroundStyle(.gray)
                                .font(.system(size:16.7))
                                .padding(.trailing,18)
                        }
                        .frame(height:46)
//                        .background(Color.red.opacity(0.1))
                        
                        
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
//                        .background(Color.red.opacity(0.1))
                        Divider() //divider
                            .frame(width:100, height: 1)
                            .background(Color.black.opacity(0.5))
                            .padding(.trailing,230)
                        
                        
                        Text("토스뱅크1000-9047-0710") //토스뱅크 Row
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment:.leading)
                            .padding(.leading,26)
                            .padding(.top,89)
//                            .background(Color.red.opacity(0.1))
                        
                        
                        HStack{ //현재 금액 Row
                            Text("38,841원")
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
//                        .background(Color.red.opacity(0.1))
                        
                        
                        HStack{ //보내기 Row
                            Spacer()
                            ZStack{ //rectangle 좌우로 생성
                                RoundedRectangle(cornerRadius:15)
                                    .fill(Color(red: 232/255, green:242/255, blue: 255/255))
                                    .frame(width:170, height:53)
                                Text("채우기")
                                    .font(.system(size:18.4))
                                    .foregroundColor(Color(red: 95/255, green:154/255, blue: 241/255))
                            }
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius:15)
                                    .fill(Color(red: 49/255, green:130/255, blue: 246/255))
                                    .frame(width: 170, height:53)
                                Text("보내기")
                                    .font(.system(size:18.4))
                                    .foregroundColor(Color(red: 197/255, green:219/255, blue: 252/255))
                            }
                            Spacer()
                        }
                        .frame(height:66)
//                        .background(Color.red.opacity(0.1))
                        
                        
                        HStack{ //114원 지금받기
                                Image("thunder")
                                    .resizable()
                                    .frame(width:46,height:46)
                                    .padding(.leading,26)
                                VStack(alignment:.leading){
                                    Text("어제까지 쌓인 이자")
                                        .padding(.leading,13)
                                        .foregroundColor(Color(red:184/255, green:190/255, blue:197/255))
                                        .font(.system(size:13.3))
                                        .padding(.bottom,1)
                                    Text("114원 지금 받기")
                                        .padding(.leading,13)
                                        .foregroundStyle(.gray)
                                        .font(.system(size:18))
                                }
                                Spacer()
                                Image("arrowbold")
                                    .resizable()
                                    .frame(width:7,height:13)
                                    .padding(.trailing,28)
                        }
                        .frame(height:99)
//                        .background(Color.red.opacity(0.1))
                        
                        Rectangle() //gray line
                            .fill(Color.gray.opacity(0.1))
                            .frame(maxWidth: .infinity, maxHeight: 16)
               
                        
                        HStack{ //전체 Row
                            Text("전체")
                                .font(.system(size:16.7))
                                .foregroundStyle(.gray)
                                .padding(.leading,27)
                            Image("arrowdown")
                                .resizable()
                                .frame(width:13,height:7)
                                .padding(.leading,2)
                            Spacer()
                            Image("magnify")
                                .resizable()
                                .frame(width:20,height:19)
                                .padding(.trailing,28)
                        }
                        .frame(height:56)
//                        .background(Color.red.opacity(0.1))
                        
                        HStack{
                            Text("3월 22일")
                                .font(.system(size:13.5))
                                .foregroundStyle(.gray)
                                .padding(.leading,27)
                            Spacer()
                        }

                        
                        ForEach(PaymentData.payment.indices, id: \.self){ sectionIndex in //2차 배열로 PaymentCell 그리기
                            if sectionIndex == 1{
                                HStack{
                                    Text("3월 21일")
                                        .font(.system(size:13.5))
                                        .foregroundStyle(.gray)
                                        .padding(.leading,27)
                                        .padding(.top,24)
                                    Spacer()
                                }
                            }
                            ForEach(PaymentData.payment[sectionIndex]){ item in
                                PaymentCell(data: item)
                                    .padding(.top,24)
                            }
                        }
                        
                        
                        

                        
                        
                        
                    } //VStack
                } //ScrollView
            } //ZStack
        .navigationBarHidden(true)
//        } //NavigationStack
    }
}

#Preview {
    View2()
}
