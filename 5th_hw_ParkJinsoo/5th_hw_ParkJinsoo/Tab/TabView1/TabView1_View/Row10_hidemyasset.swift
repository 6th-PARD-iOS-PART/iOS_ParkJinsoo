//
//  Row10_hidemyasset.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/28/25.
//

import SwiftUI

struct Row10_hidemyasset: View {
    
    var body: some View {
        HStack{ //내자산숨기기
            Spacer()
            Text("내 자산 숨기기")
                .font(.system(size:15))
                .foregroundStyle(.gray)
            Spacer()
            Text("금액 가리기")
                .font(.system(size:15.3))
                .foregroundStyle(.gray)
            Spacer()
        } //내자산숨기기
        .frame(height:150)
        
    }
}

#Preview {
    Row10_hidemyasset()
}


