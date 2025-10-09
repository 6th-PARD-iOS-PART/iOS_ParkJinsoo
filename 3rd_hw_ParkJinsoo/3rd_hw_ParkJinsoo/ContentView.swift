//
//  ContentView.swift
//  3rd_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNavigationActive = false //현재 상태 추적, 버튼이 눌리면 true
    
    var body: some View {
        
        NavigationStack{ //NavigationView
        ZStack{
            Color.gray.opacity(0.1).ignoresSafeArea()
            
                VStack{
                    HStack{ //First Row
                        Image("ToDo")
                            .resizable()
                            .frame(width:21,height:22)
                            .padding(.leading,25)
                        Image("할일")
                            .resizable()
                            .frame(width:36,height:18)
                            .padding(.leading,12)
                        Image("arrow")
                            .resizable()
                            .frame(width:8,height:12)
                            .padding(.leading,13)
                        Spacer()
                        Image("결제")
                            .resizable()
                            .frame(width:40,height:25)
                            .padding(.trailing,23)
                        ZStack{
                            Image("종")
                                .resizable()
                                .frame(width:22,height:25)
                                .padding(.trailing,29)
                            Image("빨간점")
                                .resizable()
                                .frame(width:8,height:9)
                                .padding(.bottom,30)
                        }
                    } //First Row

                    
                    
                    List{ // 스크롤뷰 끝까지 묶기
                        Section{ //Second Row
                            HStack{
                                Image("치아")
                                    .resizable()
                                    .frame(width:31,height:35)
                                    .padding(.leading,36)
                                VStack(alignment:.leading){
                                    Text("치아는 뼈일까?")
                                        .padding(.leading,13)
                                        .foregroundStyle(.gray)
                                        .font(.system(size:15.3))
                                        .padding(.bottom,1)
                                    Text("정답보기")
                                        .padding(.leading,13)
                                        .foregroundStyle(.blue)
                                        .font(.system(size:17.4))
                                }
                                Spacer()
                                Image("arrowbold")
                                    .resizable()
                                    .frame(width:7,height:13)
                                    .padding(.trailing,30)
                            }
                            .frame(height:99)
                            .listRowInsets(EdgeInsets()) //여백 없애기(리스트 틀 무효화)
                        } //Second Row
                        
                        
                        Section{ //Third Row
                            HStack{
                                Text("토스뱅크")
                                    .font(.system(size:17.5))
                                    .padding(.leading,25)
                                Spacer()
                                Text("내 소비복권긁기")
                                    .font(.system(size:13.5))
                                    .padding(.trailing,14)
                                    .foregroundStyle(.blue)
                                Image("arrowbold")
                                    .resizable()
                                    .frame(width:7,height:13)
                                    .padding(.trailing,30)
                            }
                            .frame(height:65)
                            .listRowInsets(EdgeInsets())
                        }//Third Row
                        
                        
            Section{ //통장목록
                ForEach(MockData.modeling){ item in
                    ListCell(data: item, isNavigationActive: $isNavigationActive) //ListCell 반복구문으로 실행, MockData를 가져옴 //
                    //ListCell에 data랑 바인딩 한거 전달
                            .listRowSeparator(.hidden) //구분 선 제거
                            }
                            HStack(spacing:25){
                                Text("대출0")
                                    .font(.system(size:13.3))
                                    .foregroundStyle(.gray)
                                    .padding(.leading,5)
                                Rectangle()
                                    .frame(width:1,height:20)
                                    .foregroundStyle(.gray)
                                Text("증권7")
                                    .font(.system(size:13.3))
                                    .foregroundStyle(.gray)
                                Rectangle()
                                    .frame(width:1,height:20)
                                    .foregroundStyle(.gray)
                                Text("저축3")
                                    .font(.system(size:13.3))
                                    .foregroundStyle(.gray)
                                Rectangle()
                                    .frame(width:1,height:20)
                                    .foregroundStyle(.gray)
                                Text("전체26")
                                    .font(.system(size:13.3))
                                    .foregroundStyle(.gray)
                            }
                            .padding(.horizontal,20)
                        } //통장목록
                        

                        

                Section{ //3월에 쓴돈 Row
                    HStack{
                        ZStack{
                            Image("circle")
                                .resizable()
                                .frame(width:34,height:34)
                                .padding(.leading,16)
                            Image("W")
                                .resizable()
                                .frame(width:25,height:19)
                                .padding(.leading,16)
                        }
                        VStack(alignment:.leading){
                            Text("823,643원")
                                .font(.system(size:18.2))
                                .padding(.leading,5)
                            Text("3월에 쓴돈")
                                .font(.system(size:13.3))
                                .padding(.leading,5)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width:59,height:36)
                                .foregroundStyle(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            Text("내역")
                                .font(.system(size:13.5))
                                .foregroundStyle(.gray)
                        }
                        .padding(.trailing,19)
                    }
                    .frame(height:86)
                    .listRowInsets(EdgeInsets())
                } //3월에 쓴돈 Row
                        
                        
                Section{ //내 신용점수 Row
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
                    .listRowInsets(EdgeInsets())
                } //내 신용점수 Row
                        
                        
                Section{ //7만원 지급 Row
                    HStack{
                        Image("mail")
                            .resizable()
                            .frame(width:50,height:50)
                            .padding(.leading,16)
                        VStack(alignment:.leading){
                            Text("7만원이 지급되었습니다")
                                .font(.system(size:17.5))
                                .foregroundColor(Color(red: 82/255, green: 89/255, blue: 101/255,))
                            Text("빗썸신규회원100%지급")
                                .font(.system(size:15.7))
                                .foregroundStyle(.gray)
                                .padding(.top,1)
                        }
                    }
                    .frame(height:94)
                    .listRowInsets(EdgeInsets())
                } //7만원 지급 Row
                
                        
                Section(header:Text("박진수님을 위해 준비했어요") //header
                            .font(.system(size:17.3)))
                {//카드혜택 Row
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
                    .listRowInsets(EdgeInsets())
                } //카드혜택 Row


                Section{ //Last Row
                    VStack{
                        Spacer()
                        HStack{
                            Image("receipt")
                                .resizable()
                                .frame(width:21,height:24)
                                .padding(.leading,16)
                            Text("내현금영수증")
                                .font(.system(size:15.9))
                                .padding(.leading,26)
                                .foregroundStyle(.gray)
                            Spacer()
                            Image("arrowbold")
                                .resizable()
                                .frame(width:8,height:13)
                                .padding(.trailing,28)
                        }
                        Spacer()
                        HStack{
                            Image("creditcard")
                                .resizable()
                                .frame(width:19,height:25)
                                .padding(.leading,16)
                            Text("토스신용카드")
                                .font(.system(size:15.7))
                                .padding(.leading,26)
                                .foregroundStyle(.gray)
                            Spacer()
                            Image("arrowbold")
                                .resizable()
                                .frame(width:8,height:13)
                                .padding(.trailing,28)
                        }
                        Spacer()
                        HStack{
                            Image("calculator")
                                .resizable()
                                .frame(width:21,height:25)
                                .padding(.leading,16)
                            Text("더 낸 연말정산 돌려받기")
                                .font(.system(size:15.3))
                                .padding(.leading,26)
                                .foregroundStyle(.gray)
                            Spacer()
                            Image("arrowbold")
                                .resizable()
                                .frame(width:8,height:13)
                                .padding(.trailing,28)
                        }
                        Spacer()
                    }
                    .frame(height:181)
                    .listRowInsets(EdgeInsets())
                } //Last Row
                
                        
            HStack{ //내자산숨기기
                Spacer()
                    Text("내 자산 숨기기")
                        .font(.system(size:15))
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("금액 가리기")
                        .font(.system(size:15.3))
                        .foregroundStyle(.gray)
                    Spacer()
                  } //내자산숨기기
                        .frame(height:150)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear) //섹션 배경 없애기
                    
                        
                        
                        
            } //List
                .listSectionSpacing(10) //섹션 간 간격
                    
                .navigationDestination(isPresented: $isNavigationActive){
                    View2() //destination 지정
                }
                    
            } //VStack
        } //ZStack
        } //NavigationView
    }
}

#Preview {
    ContentView()
}
