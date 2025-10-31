//
//  Row1_todo.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/27/25.
//
import SwiftUI

struct Row1_todo: View {
    
    var body: some View {
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

    }
}

#Preview {
    Row1_todo()
}
