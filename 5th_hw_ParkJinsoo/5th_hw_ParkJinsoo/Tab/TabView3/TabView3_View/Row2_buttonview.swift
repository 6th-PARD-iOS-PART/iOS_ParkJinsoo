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
    @Binding var path: NavigationPath
    
    var body: some View {
        
        HStack(spacing:25){
            ForEach(categories, id: \.self) { category in
                Button {
                    selectedCategory = category
                    if category != "모두" {
                        path.append(category)}
                } label: {
                    Text(category)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(selectedCategory == category ? Color.blue : Color.gray)
                        .padding(.vertical, 10)
                }.background(
                    VStack {
                        Spacer()
                        if selectedCategory == category {
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height: 2)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                )
            }
        }
        
        
        
    }
}

#Preview {
    Row2_buttonview(selectedCategory: .constant("모두"),
    path: .constant(NavigationPath()))
}
