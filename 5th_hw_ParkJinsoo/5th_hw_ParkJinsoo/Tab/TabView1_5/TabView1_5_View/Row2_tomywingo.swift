//
//  Row2_tomywingo.swift
//  5th_hw_ParkJinsoo
//
//  Created by Jinsoo Park on 10/30/25.
//

import SwiftUI

struct Row2_tomywingo: View {
    var body: some View {
        
        VStack(spacing:8){
            HStack{
                Text("내 WINGO통장")
                    .font(.system(size:28))
                    .bold()
                    .foregroundStyle(.blue)
                Text("으로")
                    .font(.system(size:28))
                    .bold()
                    .padding(.leading,-7)
            }
            HStack{
                Text("1원을")
                    .font(.system(size:28))
                    .bold()
            }
            HStack{
                Text("옮길까요?")
                    .font(.system(size:28))
                    .bold()
            }
        }
        .frame(height:400)
        //                .background(Color.red.opacity(0.1))

        
        
    }
}

#Preview {
    Row2_tomywingo()
}
