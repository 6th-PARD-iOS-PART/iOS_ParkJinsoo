//
//  Row4_onedayprice.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//
import SwiftUI

struct Row4_onedayprice: View {
    
    var body: some View {
        
        HStack{
            Rectangle()
                .frame(width:50,height:1)
                .foregroundStyle(.gray)
            Text("50초·스크롤 해야 시간이 줄어요")
                .foregroundStyle(.gray)
                .font(.system(size:14))
            Rectangle()
                .frame(width:50,height:1)
                .foregroundStyle(.gray)
        }
        .padding(.bottom,20)
        
        HStack{
            Text("하루특가")
                .font(.system(size:22))
                .bold()
                .padding(.leading,20)
            
            Spacer()
            Text("전체보기")
                .foregroundStyle(.gray)
                .font(.system(size:16))
                .padding(.trailing,5)
            Image("arrowbold")
                .resizable()
                .frame(width:8,height:13)
                .padding(.trailing,20)
        }
        
        if let kiwiview = ShopData.product.first(where: { $0.name == "키위" }) {
            ProductCard(product: kiwiview)
        }
        
    }
}

#Preview {
    Row4_onedayprice()
}



