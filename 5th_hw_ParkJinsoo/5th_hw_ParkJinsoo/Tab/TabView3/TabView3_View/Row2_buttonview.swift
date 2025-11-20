//
//  Row2_buttonview.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/31/25.
//

import SwiftUI

struct Row2_buttonview: View {
    let categories = ["모두", "특가", "식품", "의류", "전자제품", "뷰티"]
    @Binding var selectedCategory: String
    
    var body: some View {
        
        HStack(spacing:25){
            ForEach(categories, id: \.self) { category in
                Button {
                    selectedCategory = category
                } label: {
                    Text(category)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(selectedCategory == category ? Color.blue : Color.gray)
                        .padding(.vertical, 10)
                }.background(
                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(selectedCategory == category ? Color.blue : .clear)
                            .frame(height: 2)
                    }
                )
            }
        }
        
        
        
    }
}

#Preview {
    Row2_buttonview(selectedCategory: .constant("모두"))
}
