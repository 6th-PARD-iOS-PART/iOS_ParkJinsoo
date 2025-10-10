//
//  View4.swift
//  4th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/10/25.
//
import SwiftUI

struct View4: View {
    @Binding var path: NavigationPath
    @State private var amount: String = "" //입력한 금액 저장
    @Environment(InfoContainer.self) var infoContainer
    @State var isOn: Bool = false
    @State var next: Bool = false
    @State private var warning: String = "" //경고문
    
    var body: some View {
    ZStack{
        Color.white.ignoresSafeArea()
            
            VStack(spacing:0){
                HStack{ // 토스뱅크송금 Row
                    ZStack{
                        Text("토스뱅크송금")
                            .foregroundStyle(.gray)
                            .font(.system(size:18.4))
                            .padding(.trailing,20)
                        HStack{
                            Button{
                                path.removeLast()
                            }label:{
                                Image("arrowleft")
                                    .resizable()
                                    .frame(width:12,height:20)
                                    .padding(.leading,20)
                            }
                            Spacer()
                        }
                    }
                }
              .frame(height:62)
//              .background(Color.red.opacity(0.1))
                
                
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
                
                
                HStack{ //내 WINGO 통장으로
                    VStack(alignment:.leading){
                        HStack{
                            Text(infoContainer.selectedName)
                                .foregroundStyle(.black)
                                .bold()
                                .font(.system(size:22))
                                .padding(.leading,27)
                            Text("으로")
                                .foregroundStyle(.gray)
                                .font(.system(size:22))
                                .padding(.leading,-5)
                            Spacer()
                        }
                        HStack{
                            Text(infoContainer.selectedBank)
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
                }
                
                
                Rectangle()
                    .fill(.white)
//                    .fill(.red.opacity(0.1))
                    .frame(height:100)
                
                if isOn{
                    Button{
                        path.append("View5")
                    }label:{
                        ZStack{
                        Rectangle()
                            .frame(height:60)
                            .foregroundColor(Color(red:49/255,
                                green:130/255, blue:246/255))
                        Text("다음")
                            .font(.system(size:18))
                            .foregroundColor(Color(red:212/255, green:228/255, blue:252/255))
                    }
                }
                }
                
                
                
                //값이 들어가기 전 = 버튼 없음
                //송금 가능한 값 = 버튼 생김
                // 송금 불가능한 값 = 버튼 비활성화
                if let inter = Int(amount){ //@State이슈
                    if inter < 1{ //버튼없음 -
//                        ZStack{
//                            Rectangle()
//                                .fill(.white)
//                            .frame(height:60)}
                        Text("")
                            .padding(.bottom,-30)
                    }else if inter < 26657{  //버튼 생김
                            Button{
                                path.append("View5")
                            }label:{
                                ZStack{
                                Rectangle()
                                    .frame(height:60)
                                    .foregroundColor(Color(red:49/255,
                                        green:130/255, blue:246/255))
                                Text("다음")
                                    .font(.system(size:18))
                                    .foregroundColor(Color(red:212/255, green:228/255, blue:252/255))
                            }
                        }
                    }else{ //버튼 비활성화
                        ZStack{
                            Rectangle()
                                .frame(height:60)
                                .foregroundColor(Color(red:201/255,
                                    green:222/255, blue:252/255))
                            Text("다음")
                                .font(.system(size:18))
                                .foregroundColor(Color(red:245/255, green:249/255, blue:254/255))}
                                            }
                } //if let

                                 
                
                KeyPad(amount: $amount) //키패드
                    .padding(.top,20)
                

                    
    //경고문 2차bool?
    //spacing

                    

                
                    
                } //VStackAll
        } //ZStack
        .navigationBarHidden(true)
    }
}

#Preview {
    View4(path: .constant(NavigationPath()))
        .environment(InfoContainer())
}

