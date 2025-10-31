//
//  Row6_all.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row6_all: View {
    
    var body: some View {
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
        
    }
}

#Preview {
    Row6_all()
}
