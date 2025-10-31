//
//  CategoryView.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//
import SwiftUI

struct CategoryView: View {
    let category: String
    
    var filteredProducts: [ShopData] {
        if category == "모두" {
            return ShopData.product
        } else {
            return ShopData.product.filter { $0.category == category }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(category)
                    .font(.system(size: 18))
                    .bold()
                    .padding(.leading,20)
                    .padding(.top, 8)
                
                ForEach(filteredProducts) { product in
                    ProductCard(product: product)
                }
            }
        }
        .navigationTitle(category)
    }
}

#Preview {
    CategoryView(category: "전자제품")
}
