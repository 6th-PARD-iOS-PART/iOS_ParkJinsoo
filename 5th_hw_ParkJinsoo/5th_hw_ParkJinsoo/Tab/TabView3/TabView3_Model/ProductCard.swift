//
//  ProductCard.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//

import SwiftUI

struct ProductCard: View {
    let product: ShopData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack(alignment: .topLeading){
    
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 380, height: 175)
                    .cornerRadius(15)
                
                if product.tag.isEmpty {
                    Text("")
                } else {
                    if product.name == "키위" {
                        Text("00:06:14 남음")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.black)
                            .cornerRadius(6)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        Text(product.tag)
                            .font(.caption)
                            .foregroundColor(.pink)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.pink.opacity(0.1))
                            .cornerRadius(6)
                            .padding(.leading, 100)
                            .padding(.top, 5)
                    }else{
                        Text(product.tag)
                            .font(.caption)
                            .foregroundColor(.pink)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.pink.opacity(0.1))
                            .cornerRadius(6)
                            .padding(.leading, 15)
                            .padding(.top, 5)
                    }
                }
                    
            } //ZStack
        
                
                Text(product.subtitle)
                    .font(.system(size: 14))
                    .lineLimit(1)
                    .padding(.top,5)
                
                HStack(spacing: 8) {
                    Text("\(Int(product.price))원")
                        .font(.system(size: 16, weight: .bold))
                    Text("\(Int(product.originalprice))원")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
//                        .strikethrough()
                    
                    HStack{
                        Image("tosspurple")
                            .resizable()
                            .frame(width:10,height:10)
                            .padding(.trailing,-7)
                        Text(product.reserve)
                            .font(.system(size: 12))
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(6)
            
                }
                
                Text(product.view)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.bottom,20)
                
                
                
        } //VStackAll
        .padding(.horizontal)
    }
}

#Preview {
    ProductCard(product: ShopData.product.first!)
}
