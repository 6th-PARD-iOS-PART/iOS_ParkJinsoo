//
//  Row1_tossshopping.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//

import SwiftUI

struct Row1_tossshopping: View {
    
    var body: some View {
        HStack{ //Toss Shopping
            Text("토스쇼핑")
                .font(.system(size:26))
                .fontWeight(.black)
                .padding(.leading,20)
            
            
            Spacer()
            Image("돋보기")
                .resizable()
                .frame(width:24,height:24)
                .padding(.trailing,20)
            Image("사람")
                .resizable()
                .frame(width:22,height:22)
                .padding(.trailing,20)
            Image("카트")
                .resizable()
                .frame(width:26,height:23)
                .padding(.trailing,20)
        } //Toss Shopping
    }
}

#Preview {
    Row1_tossshopping()
}
