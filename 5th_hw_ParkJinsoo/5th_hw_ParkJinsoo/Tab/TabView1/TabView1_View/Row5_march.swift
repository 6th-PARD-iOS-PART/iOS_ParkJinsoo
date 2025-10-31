//
//  Row5_march.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//

import SwiftUI

struct Row5_march: View {
    
    var body: some View {
        HStack{
            ZStack{
                Image("circle")
                    .resizable()
                    .frame(width:34,height:34)
                    .padding(.leading,16)
                Image("W")
                    .resizable()
                    .frame(width:25,height:19)
                    .padding(.leading,16)
            }
            VStack(alignment:.leading){
                Text("823,643원")
                    .font(.system(size:18.2))
                    .padding(.leading,5)
                Text("3월에 쓴돈")
                    .font(.system(size:13.3))
                    .padding(.leading,5)
                    .foregroundStyle(.gray)
            }
            Spacer()
            ZStack{
                Rectangle()
                    .frame(width:59,height:36)
                    .foregroundStyle(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                Text("내역")
                    .font(.system(size:13.5))
                    .foregroundStyle(.gray)
            }
            .padding(.trailing,19)
        }
        .frame(height:86)
        
    }
}

#Preview {
    Row5_march()
}
