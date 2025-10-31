//
//  Row7_70thousand.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//

import SwiftUI

struct Row7_70thousand: View {
    
    var body: some View {
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
        
    }
}

#Preview {
    Row7_70thousand()
}
