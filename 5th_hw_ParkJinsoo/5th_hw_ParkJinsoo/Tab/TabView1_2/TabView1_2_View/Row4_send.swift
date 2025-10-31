//
//  Row4_send.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row4_send: View {
    @Binding var path: NavigationPath
    
    var body: some View {
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
            Button{
                path.append("TabView1_3_Main")
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius:15)
                        .fill(Color(red: 49/255, green:130/255, blue: 246/255))
                        .frame(width: 170, height:53)
                    Text("보내기")
                        .font(.system(size:18.4))
                        .foregroundColor(Color(red: 197/255, green:219/255, blue: 252/255))
                }
            }
            
            Spacer()
        }
        .frame(height:66)
        //                        .background(Color.red.opacity(0.1))
        
    }
}

#Preview {
    Row4_send(path: .constant(NavigationPath()))
}







