//
//  Row2_teeth.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/27/25.
//

import SwiftUI

struct Row2_teeth: View {
    
    var body: some View {
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
    }
}

#Preview {
    Row2_teeth()
}



