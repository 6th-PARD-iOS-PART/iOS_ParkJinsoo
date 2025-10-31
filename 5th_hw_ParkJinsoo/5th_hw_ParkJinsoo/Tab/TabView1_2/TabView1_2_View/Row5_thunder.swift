//
//  Row5_thunder.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/29/25.
//

import SwiftUI

struct Row5_thunder: View {
    
    var body: some View {
        HStack{ //114원 지금받기
                Image("thunder")
                    .resizable()
                    .frame(width:46,height:46)
                    .padding(.leading,26)
                VStack(alignment:.leading){
                    Text("어제까지 쌓인 이자")
                        .padding(.leading,13)
                        .foregroundColor(Color(red:184/255, green:190/255, blue:197/255))
                        .font(.system(size:13.3))
                        .padding(.bottom,1)
                    Text("114원 지금 받기")
                        .padding(.leading,13)
                        .foregroundStyle(.gray)
                        .font(.system(size:18))
                }
                Spacer()
                Image("arrowbold")
                    .resizable()
                    .frame(width:7,height:13)
                    .padding(.trailing,28)
        }
        .frame(height:99)
        //                        .background(Color.red.opacity(0.1))

        Rectangle() //gray line
            .fill(Color.gray.opacity(0.1))
            .frame(maxWidth: .infinity, maxHeight: 16)
        
    }
}

#Preview {
    Row5_thunder()
}
