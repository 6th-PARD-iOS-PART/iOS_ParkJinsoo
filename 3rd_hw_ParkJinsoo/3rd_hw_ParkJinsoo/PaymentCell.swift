//
//  PaymentCell.swift
//  3rd_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/9/25.
//
import SwiftUI

struct PaymentCell: View {
    var data: PaymentData
    
    var body: some View {
        HStack{
            Image(data.icon)
                .resizable()
                .frame(width:45,height:45)
                .padding(.leading,27)
            VStack(alignment:.leading){
                Text(data.shop)
                    .foregroundStyle(.gray)
                    .font(.system(size:18))
                    .padding(.bottom,1)
                Text(data.time)
                    .foregroundStyle(.gray)
                    .font(.system(size:14.5))
            }
            Spacer()
            VStack(alignment:.trailing){
                if data.price == "+6,900원" || data.price == "+7,300원"{ //+일때 파란색
                    Text(data.price)
                    .foregroundStyle(.blue)
                    .font(.system(size:18.3))
                    .padding(.trailing,27)
                    .padding(.bottom,1)
                }else{
                    Text(data.price)
                    .foregroundStyle(.gray)
                    .font(.system(size:18.3))
                    .padding(.trailing,27)
                    .padding(.bottom,1)
                }
                Text(data.balance)
                    .foregroundStyle(.gray)
                    .font(.system(size:13.1))
                    .padding(.trailing,27)
            }
        }
        
        
        
        
        
        
    }
}
