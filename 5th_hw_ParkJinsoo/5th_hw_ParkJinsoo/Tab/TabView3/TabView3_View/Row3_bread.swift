//
//  Row3_bread.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//
import SwiftUI

struct Row3_bread: View {
    
    var body: some View {
        
        HStack{
            VStack(alignment:.leading){
                Text("1천원대부터")
                    .font(.system(size:19))
                    .bold()
                Text("고르는 국민간식")
                    .font(.system(size:19))
                    .bold()
                Text("삼립식품초저가구매하기")
                    .padding(.top,7)
                    .font(.system(size:14))
                    .foregroundStyle(.gray)
            }
            .padding(.leading,15)
            
            Spacer()
            Image("bread")
                .resizable()
                .frame(width:140,height:124)
                .padding(.trailing,15)
        }
        .frame(width:380,height:160)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(6)
        .padding(.bottom,20)
    }
}

#Preview {
    Row3_bread()
}

