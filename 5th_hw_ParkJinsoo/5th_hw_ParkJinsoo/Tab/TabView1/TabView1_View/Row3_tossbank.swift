//
//  Row3_tossbank.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/27/25.
//
import SwiftUI

struct Row3_tossbank: View {
    
    var body: some View {
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
    }
}

#Preview {
    Row3_tossbank()
}
