//
//  ContentView.swift
//  1st_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 9/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{ //검은 배경 위에 만들기
            Color.black.ignoresSafeArea(edges: .all)
        VStack{ //위에서부터 아래로 생성
            Spacer() //아래로 밀기
            Text("0")
                .padding(.leading,280) //오른쪽 정렬
                .padding(.bottom,1) //텍스트 아래로 밀기
                .fontWeight(.light) //텍스트 두께 조정
                .font(.system(size:100)) //텍스트 사이즈 조정
                .foregroundColor(.white) //텍스트 색깔 조정
            HStack{ //가로로 한줄씩 만들기
                Circle() //원 생성
                    .fill(Color(.gray)) //색깔 채우기
                    .frame(width:80, height:80) //원 크기 맞추기
                    .padding(5) //좌우 간격 조정
                    .overlay( //원 위에 텍스트 추가
                        Text("AC")
                            .font(.system(size:40)) //텍스트 사이즈 조정
                            .foregroundColor(.black)
                            ) //텍스트 색깔 조정
                
                Circle()
                    .fill(Color(.gray))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("+/-")
                            .font(.system(size:40))
                            .foregroundColor(.black)
                            )
                
                Circle()
                    .fill(Color(.gray))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("%")
                            .font(.system(size:40))
                            .foregroundColor(.black)
                            )
                
                Circle()
                    .fill(Color(.orange))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("÷")
                            .font(.system(size:50))
                            .bold() //굵기 추가
                            .foregroundColor(.white)
                            )
            
                }
            HStack{ //다음줄 생성
                Circle()
                    .fill(Color(UIColor.secondaryLabel)) //비슷한 회색 찾아서 채우기
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("7")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
            
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("8")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
                
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("9")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
                
                Circle()
                    .fill(Color(.orange))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("×")
                            .font(.system(size:45))
                            .bold()
                            .foregroundColor(.white)
                            )
            }
            HStack{ //다음줄 생성
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("4")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("5")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("6")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
               //     .border(.red) //간격 조절 확인을 위한 프레임
                Circle()
                    .fill(.orange)
                    .frame(width:80, height:80)
                    .padding(5)
                    .overlay(
                        Text("−")
                            .font(.system(size:45))
                            .bold()
                            .foregroundColor(.white)
                            )
              //      .border(.red)
            }
            HStack{
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80,height:80)
                    .padding(5)
                    .overlay(
                        Text("1")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
              //      .border(.red)
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80,height:80)
                    .padding(5)
                    .overlay(
                        Text("2")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
              //      .border(.red)
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80,height:80)
                    .padding(5)
                    .overlay(
                        Text("3")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
             //       .border(.red)
                Circle()
                    .fill(.orange)
                    .frame(width:80,height:80)
                    .padding(5)
                    .overlay(
                        Text("+")
                            .font(.system(size:50))
                            .bold()
                            .foregroundColor(.white)
                            )
            //        .border(.red)
                }
            HStack{
                Text("0")
                    .padding(.trailing,115) //다음 원이랑 간격 두기
                    .padding(.leading,10) //위아래 정렬
                    .font(.system(size:45))
                    .foregroundColor(Color.white)
                    .background( //텍스트 뒤에 원 만들기
                        Rectangle() //직사각형
                            .fill(Color(UIColor.secondaryLabel))
                            .cornerRadius(50) //둥글게
                            .frame(width:188,height:80)
                      //      .border(.red)
                    )
                    .padding()
                Circle()
                    .fill(Color(UIColor.secondaryLabel))
                    .frame(width:80,height:80)
                    .padding(5)
                    .overlay(
                        Text(".")
                            .font(.system(size:45))
                            .foregroundColor(.white)
                            )
                  //  .border(.red)
                Circle()
                    .fill(.orange)
                    .frame(width:80,height:80)
                    .padding(5)
                    .overlay(
                        Text("=")
                            .font(.system(size:45))
                            .bold()
                            .foregroundColor(.white)
                            )
            }
        }
        }
    }
}

#Preview {
    ContentView()
}
