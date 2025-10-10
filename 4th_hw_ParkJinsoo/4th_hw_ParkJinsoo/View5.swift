//
//  View5.swift
//  4th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/10/25.
//
import SwiftUI

struct View5: View {
    @Binding var path: NavigationPath
    @Environment(InfoContainer.self) var infoContainer
    
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
                
                VStack(spacing:8){
                    HStack{
                        Text("내 WINGO통장")
                            .font(.system(size:28))
                            .bold()
                            .foregroundStyle(.blue)
                        Text("으로")
                            .font(.system(size:28))
                            .bold()
                            .padding(.leading,-7)
                    }
                    HStack{
                        Text("1원을")
                            .font(.system(size:28))
                            .bold()
                    }
                    HStack{
                        Text("옮길까요?")
                            .font(.system(size:28))
                            .bold()
                    }
                }
                .frame(height:400)
//                .background(Color.red.opacity(0.1))
                
                
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
                
                Button{
                    path.removeLast(path.count)
                }label:{
                    ZStack{
                        Rectangle()
                            .frame(width:360,height:62)
                            .foregroundStyle(.blue)
                            .cornerRadius(20)
                        Text("옮기기")
                            .font(.system(size:18))
                            .padding(.leading,20)
                            .foregroundColor(Color(red:199/255,green:229/255,blue:255/255))
                    }
                }
                
                
                ZStack{
                    Rectangle()
                        .frame(width:360,height:62)
                        .foregroundStyle(.white)
                        .cornerRadius(20)
                    Text("평생 수수료 무료")
                        .font(.system(size:16))
                        .padding(.leading,20)
                        .foregroundColor(Color(red:140/255,green:153/255,blue:164/255))
                }
                
                
                
                    
                } //VStackAll
        } //ZStack
        .navigationBarHidden(true)
    }
}

#Preview {
    View5(path: .constant(NavigationPath()))
        .environment(InfoContainer())
}

