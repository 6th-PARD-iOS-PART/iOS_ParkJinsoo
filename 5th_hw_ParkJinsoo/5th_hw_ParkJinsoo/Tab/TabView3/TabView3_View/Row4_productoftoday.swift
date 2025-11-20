//
//  Row4_productoftoday.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//

import SwiftUI

struct Row5_productoftoday: View {
    let ShopOrder = ShopViewOrder()
    
    var body: some View {
        
        HStack{
            Text("오늘의 상품")
                .font(.system(size:22))
                .bold()
                .padding(.leading,20)
            
            Spacer()
            Text("AD")
                .foregroundStyle(.gray)
                .font(.system(size:16))
                .padding(.horizontal,10)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.trailing,30)
        }
        
    }
}

#Preview {
    Row5_productoftoday()
}



