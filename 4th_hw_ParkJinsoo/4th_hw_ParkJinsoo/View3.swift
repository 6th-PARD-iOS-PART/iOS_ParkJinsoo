//
//  View3.swift
//  4th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/10/25.
//
import SwiftUI

struct View3: View {
    @Binding var path: NavigationPath
    @Environment(InfoContainer.self) var infoContainer //environment에서 가져옴
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            
            ScrollView{
                VStack(spacing:0){
                    
                    HStack{ // ArrowLeft
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
                    .frame(height:84)
//                  .background(Color.red.opacity(0.1))
                    
                    
                    HStack{ //어디로 돈을 보낼까요? Row
                        Text("어디로 돈을 보낼까요?")
                            .font(.system(size:27))
                            .bold()
                            .padding(.leading,28)
                        Spacer()
                    }
                    .frame(height:33)
//                    .background(Color.red.opacity(0.1))
                    
                    
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
                    
                    
                    Rectangle() //grayLine
                        .frame(width:350,height:2)
                        .foregroundStyle(.gray.opacity(0.1))
                        .padding(.bottom,17)
                    
                    
                    HStack{ //내 계좌 Row
                        Text("내 계좌")
                            .font(.system(size:17))
                            .padding(.leading,27)
                            .fontWeight(.light)
                        Spacer()
                        Text("+18개")
                            .font(.system(size:15))
                            .foregroundStyle(.gray)
                            .padding(.trailing,13)
                        Image("arrowbold")
                            .resizable()
                            .frame(width:7,height:13)
                            .padding(.trailing,27)
                    }
                    .frame(height:53)
//                    .background(Color.red.opacity(0.1))
                    
                    
                    ForEach(AccountData.account.indices, id: \.self){ sectionIndex in //2차 배열로 AccountData 그리기
                        if sectionIndex == 1{
                            HStack{
                                Text("최근 보낸 계좌")
                                    .font(.system(size:17))
                                    .foregroundStyle(Color(red:0.2,green:0.2,blue:0.2))
                                    .bold()
                                    .padding(.leading,27)
                                    .padding(.top,24)
                                Spacer()
                            }
                        }
                        ForEach(AccountData.account[sectionIndex]){ item in
                            AccountCell(path: $path, data: item, infoContainer: infoContainer)
                                .padding(.top,24)
                        }
                    }
                    
                } //VStackAll
            } //ScrollView
        } //ZStack

        .navigationBarHidden(true)
    }
}

#Preview {
    View3(path: .constant(NavigationPath()))
        .environment(InfoContainer())
}
