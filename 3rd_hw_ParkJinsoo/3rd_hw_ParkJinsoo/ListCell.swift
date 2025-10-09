//
//  ListCell.swift
//  3rd_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/9/25.
//
import SwiftUI

struct ListCell: View {
    var data: MockData
    
    @Binding var isNavigationActive: Bool //외부 상태 bool로 받음
    
    var body: some View {
        HStack{
            Image(data.icon)
                .resizable()
                .frame(width:34,height:34)
                .padding(.trailing,5)
         
            VStack{
                HStack{
                    Text(data.money)
                        .font(.system(size:18.2))
                    
                    if(data.money=="118원"){
                        Text("+4.42%")
                            .foregroundStyle(.red)
                    }else if(data.money=="15,257,990원"){
                        Text("-2.6%")
                            .foregroundStyle(.blue)
                    }
                    Spacer()
                }
                Text(data.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size:14.3))
                    .foregroundStyle(.gray)
            }
                if(data.icon=="bank3"){
                        ZStack{
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width:77,height:36)
                                .foregroundStyle(Color.gray.opacity(0.1))
                                .padding(.trailing,5)
                            Text("지금받기")
                                .font(.system(size:13.3))
                                .foregroundStyle(.gray)
                            }
                }else if(data.icon=="bank7" || data.icon=="bank10"){
                    Text("")
                }else{
                    Button{
                        isNavigationActive = true //누르면 bool true
                    } label: {
                            ZStack{
                                Rectangle()
                                    .cornerRadius(10)
                                    .frame(width:59,height:36)
                                    .foregroundStyle(Color.gray.opacity(0.1))
                                    .padding(.trailing,5)
                                Text("송금")
                                    .font(.system(size:13.3))
                                    .foregroundStyle(.gray)
                                 }
                            }
                    .buttonStyle(.plain) //기존 버튼 스타일 없애기
            }
        }
        
        
        
        
        
        
    }
}
